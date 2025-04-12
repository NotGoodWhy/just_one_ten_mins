import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import '../repositories/summary_repository.dart';

/// 요약 생성 유스케이스
class GenerateSummaryUseCase implements UseCase<String, GenerateSummaryParams> {
  final SummaryRepository repository;

  GenerateSummaryUseCase(this.repository);

  @override
  Future<String> call(GenerateSummaryParams params) {
    return repository.generateSummary(params.bookId, params.textContent);
  }
}

/// 요약 생성을 위한 매개변수 클래스
class GenerateSummaryParams {
  final String bookId;
  final List<String> textContent;

  const GenerateSummaryParams({
    required this.bookId,
    required this.textContent,
  });
} 