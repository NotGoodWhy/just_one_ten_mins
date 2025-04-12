import 'package:just_one_ten_mins/features/summary/data/models/summary_model.dart';

/// 요약 로컬 데이터 소스 인터페이스
abstract class SummaryLocalDataSource {
  /// 도서 ID로 요약본 조회
  Future<SummaryModel?> getSummaryByBookId(String bookId);
  
  /// 요약본 저장
  Future<void> saveSummary(SummaryModel summary);
  
  /// 요약본 삭제
  Future<void> deleteSummary(String id);
  
  /// 모든 요약본 가져오기
  Future<List<SummaryModel>> getAllSummaries();
} 