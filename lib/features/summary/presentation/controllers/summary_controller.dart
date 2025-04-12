import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import 'package:just_one_ten_mins/features/summary/domain/entities/summary.dart';
import 'package:just_one_ten_mins/features/summary/domain/usecases/generate_summary_usecase.dart';
import 'package:just_one_ten_mins/features/summary/domain/usecases/get_summary_by_bookid_usecase.dart';
import 'package:just_one_ten_mins/features/summary/domain/usecases/save_summary_usecase.dart';
import 'package:uuid/uuid.dart';

/// 요약 상태
class SummaryState {
  final bool isLoading;
  final Summary? summary;
  final String? generatedContent;
  final String? audioPath;
  final bool isGeneratingSummary;
  final bool isGeneratingAudio;
  final String? errorMessage;

  const SummaryState({
    this.isLoading = false,
    this.summary,
    this.generatedContent,
    this.audioPath,
    this.isGeneratingSummary = false,
    this.isGeneratingAudio = false,
    this.errorMessage,
  });

  SummaryState copyWith({
    bool? isLoading,
    Summary? summary,
    String? generatedContent,
    String? audioPath,
    bool? isGeneratingSummary,
    bool? isGeneratingAudio,
    String? errorMessage,
  }) {
    return SummaryState(
      isLoading: isLoading ?? this.isLoading,
      summary: summary ?? this.summary,
      generatedContent: generatedContent ?? this.generatedContent,
      audioPath: audioPath ?? this.audioPath,
      isGeneratingSummary: isGeneratingSummary ?? this.isGeneratingSummary,
      isGeneratingAudio: isGeneratingAudio ?? this.isGeneratingAudio,
      errorMessage: errorMessage,
    );
  }
}

/// 요약 컨트롤러 (Riverpod)
class SummaryController extends StateNotifier<SummaryState> {
  final GetSummaryByBookIdUseCase getSummaryByBookIdUseCase;
  final GenerateSummaryUseCase generateSummaryUseCase;
  final SaveSummaryUseCase saveSummaryUseCase;

  SummaryController({
    required this.getSummaryByBookIdUseCase,
    required this.generateSummaryUseCase,
    required this.saveSummaryUseCase,
  }) : super(const SummaryState());

  /// 도서 ID로 요약본 로드
  Future<void> loadSummaryByBookId(String bookId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final summary = await getSummaryByBookIdUseCase(IdParams(id: bookId));
      state = state.copyWith(
        isLoading: false,
        summary: summary,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '요약본을 불러오는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 텍스트 컨텐츠로 요약 생성 및 저장
  Future<void> generateAndSaveSummary({
    required String bookId,
    required List<String> textContent,
    required String title,
  }) async {
    state = state.copyWith(isGeneratingSummary: true, errorMessage: null);
    try {
      final summaryContent = await generateSummaryUseCase(
        GenerateSummaryParams(
          bookId: bookId,
          textContent: textContent,
        ),
      );
      
      // 생성된 요약 컨텐츠 저장
      state = state.copyWith(
        generatedContent: summaryContent,
        isGeneratingSummary: false,
      );

      // 요약 엔티티 생성 및 저장
      final characterCount = summaryContent.length;
      final summary = Summary(
        id: const Uuid().v4(),
        bookId: bookId,
        content: summaryContent,
        createdAt: DateTime.now(),
        characterCount: characterCount,
        // 예상 시간은 나중에 계산
        estimatedReadingTime: characterCount ~/ 700, // 분당 700자 읽는다고 가정
        estimatedSpeakingTime: characterCount ~/ 400, // 분당 400자 말한다고 가정
      );

      await saveSummaryUseCase(SaveSummaryParams(summary: summary));
      state = state.copyWith(summary: summary);
    } catch (e) {
      state = state.copyWith(
        isGeneratingSummary: false,
        errorMessage: '요약본을 생성하는 중 오류가 발생했습니다: $e',
      );
    }
  }
}

/// 요약 컨트롤러 프로바이더
final summaryControllerProvider =
    StateNotifierProvider<SummaryController, SummaryState>((ref) {
  final getSummaryByBookIdUseCase = ref.watch(getSummaryByBookIdUseCaseProvider);
  final generateSummaryUseCase = ref.watch(generateSummaryUseCaseProvider);
  final saveSummaryUseCase = ref.watch(saveSummaryUseCaseProvider);

  return SummaryController(
    getSummaryByBookIdUseCase: getSummaryByBookIdUseCase,
    generateSummaryUseCase: generateSummaryUseCase,
    saveSummaryUseCase: saveSummaryUseCase,
  );
});

/// GetSummaryByBookIdUseCase 프로바이더
final getSummaryByBookIdUseCaseProvider = Provider<GetSummaryByBookIdUseCase>((ref) {
  final repository = ref.watch(summaryRepositoryProvider);
  return GetSummaryByBookIdUseCase(repository);
});

/// GenerateSummaryUseCase 프로바이더
final generateSummaryUseCaseProvider = Provider<GenerateSummaryUseCase>((ref) {
  final repository = ref.watch(summaryRepositoryProvider);
  return GenerateSummaryUseCase(repository);
});

/// SaveSummaryUseCase 프로바이더
final saveSummaryUseCaseProvider = Provider<SaveSummaryUseCase>((ref) {
  final repository = ref.watch(summaryRepositoryProvider);
  return SaveSummaryUseCase(repository);
}); 