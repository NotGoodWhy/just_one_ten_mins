import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/domain/entities/pdf_document.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/domain/usecases/pick_pdf_file_usecase.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/domain/usecases/load_pdf_document_usecase.dart';
import 'package:just_one_ten_mins/features/book_management/domain/entities/book.dart';
import 'package:just_one_ten_mins/features/book_management/domain/usecases/save_book_usecase.dart';
import 'package:uuid/uuid.dart';

/// PDF 상태
class PdfState {
  final bool isLoading;
  final String? selectedFilePath;
  final PdfDocument? document;
  final List<String>? extractedText;
  final String? errorMessage;

  const PdfState({
    this.isLoading = false,
    this.selectedFilePath,
    this.document,
    this.extractedText,
    this.errorMessage,
  });

  PdfState copyWith({
    bool? isLoading,
    String? selectedFilePath,
    PdfDocument? document,
    List<String>? extractedText,
    String? errorMessage,
  }) {
    return PdfState(
      isLoading: isLoading ?? this.isLoading,
      selectedFilePath: selectedFilePath ?? this.selectedFilePath,
      document: document ?? this.document,
      extractedText: extractedText ?? this.extractedText,
      errorMessage: errorMessage,
    );
  }
}

/// PDF 컨트롤러 (Riverpod)
class PdfController extends StateNotifier<PdfState> {
  final PickPdfFileUseCase pickPdfFileUseCase;
  final LoadPdfDocumentUseCase loadPdfDocumentUseCase;
  final SaveBookUseCase saveBookUseCase;

  PdfController({
    required this.pickPdfFileUseCase,
    required this.loadPdfDocumentUseCase,
    required this.saveBookUseCase,
  }) : super(const PdfState());

  /// PDF 파일 선택 및 로드
  Future<void> pickAndLoadPdf() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final filePath = await pickPdfFileUseCase(NoParams());
      if (filePath != null) {
        state = state.copyWith(selectedFilePath: filePath);
        await _loadPdfDocument(filePath);
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'PDF 파일을 선택하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// PDF 문서 로드
  Future<void> _loadPdfDocument(String path) async {
    try {
      final document = await loadPdfDocumentUseCase(LoadPdfParams(path: path));
      state = state.copyWith(
        isLoading: false,
        document: document,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'PDF 문서를 로드하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 도서로 저장
  Future<void> saveAsBook() async {
    if (state.document == null) {
      state = state.copyWith(
        errorMessage: '저장할 PDF 문서가 없습니다.',
      );
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final pdfDoc = state.document!;
      final book = Book(
        id: const Uuid().v4(),
        title: pdfDoc.name ?? '무제 PDF',
        author: '알 수 없음',
        type: BookType.pdf,
        filePath: pdfDoc.path,
        pageCount: pdfDoc.pageCount,
        addedDate: DateTime.now(),
      );

      await saveBookUseCase(SaveBookParams(book: book));
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '도서로 저장하는 중 오류가 발생했습니다: $e',
      );
    }
  }
}

/// PDF 컨트롤러 프로바이더
final pdfControllerProvider =
    StateNotifierProvider<PdfController, PdfState>((ref) {
  final pickPdfFileUseCase = ref.watch(pickPdfFileUseCaseProvider);
  final loadPdfDocumentUseCase = ref.watch(loadPdfDocumentUseCaseProvider);
  final saveBookUseCase = ref.watch(saveBookUseCaseProvider);

  return PdfController(
    pickPdfFileUseCase: pickPdfFileUseCase,
    loadPdfDocumentUseCase: loadPdfDocumentUseCase,
    saveBookUseCase: saveBookUseCase,
  );
});

/// PickPdfFileUseCase 프로바이더
final pickPdfFileUseCaseProvider = Provider<PickPdfFileUseCase>((ref) {
  final repository = ref.watch(pdfRepositoryProvider);
  return PickPdfFileUseCase(repository);
});

/// LoadPdfDocumentUseCase 프로바이더
final loadPdfDocumentUseCaseProvider = Provider<LoadPdfDocumentUseCase>((ref) {
  final repository = ref.watch(pdfRepositoryProvider);
  return LoadPdfDocumentUseCase(repository);
}); 