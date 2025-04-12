import '../entities/summary.dart';

/// 요약 레포지토리 인터페이스
abstract class SummaryRepository {
  /// 도서 ID로 요약본 조회
  Future<Summary?> getSummaryByBookId(String bookId);
  
  /// 요약본 저장
  Future<void> saveSummary(Summary summary);
  
  /// 요약본 삭제
  Future<void> deleteSummary(String id);
  
  /// 텍스트 요약 처리 (AI 요약)
  Future<String> generateSummary(String bookId, List<String> textContent);
  
  /// 요약 텍스트를 음성으로 변환
  Future<String> generateAudio(String summaryId);
  
  /// 예상 읽기/듣기 시간 계산
  Future<Map<String, int>> calculateEstimatedTimes(String content);
} 