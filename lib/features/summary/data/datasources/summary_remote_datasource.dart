/// 요약 원격 데이터 소스 인터페이스 (AI 처리)
abstract class SummaryRemoteDataSource {
  /// 텍스트 요약 처리 (AI 요약)
  Future<String> generateSummary(List<String> textContent);
  
  /// 요약 텍스트를 음성으로 변환
  Future<String> generateAudio(String text);
  
  /// 예상 읽기/듣기 시간 계산
  Future<Map<String, int>> calculateEstimatedTimes(String content);
} 