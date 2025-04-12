import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import '../entities/summary.dart';
import '../repositories/summary_repository.dart';

/// 요약본 저장 유스케이스
class SaveSummaryUseCase implements UseCase<void, SaveSummaryParams> {
  final SummaryRepository repository;

  SaveSummaryUseCase(this.repository);

  @override
  Future<void> call(SaveSummaryParams params) {
    return repository.saveSummary(params.summary);
  }
}

/// 요약본 저장을 위한 매개변수 클래스
class SaveSummaryParams {
  final Summary summary;

  const SaveSummaryParams({required this.summary});
} 