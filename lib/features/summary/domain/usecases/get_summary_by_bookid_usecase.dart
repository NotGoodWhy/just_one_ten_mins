import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import '../entities/summary.dart';
import '../repositories/summary_repository.dart';

/// 도서 ID로 요약본 조회 유스케이스
class GetSummaryByBookIdUseCase implements UseCase<Summary?, IdParams> {
  final SummaryRepository repository;

  GetSummaryByBookIdUseCase(this.repository);

  @override
  Future<Summary?> call(IdParams params) {
    return repository.getSummaryByBookId(params.id);
  }
} 