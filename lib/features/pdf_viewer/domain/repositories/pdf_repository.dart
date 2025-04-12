import '../entities/pdf_document.dart';

/// PDF 레포지토리 인터페이스
abstract class PdfRepository {
  /// PDF 파일 선택 (파일 피커 열기)
  Future<String?> pickPdfFile();
  
  /// PDF 파일 로드
  Future<PdfDocument> loadPdfDocument(String path);
  
  /// PDF 텍스트 추출
  Future<List<String>> extractText(String path);
  
  /// PDF 페이지 수 가져오기
  Future<int> getPageCount(String path);
  
  /// PDF 파일 저장 (외부 파일에서 앱 내부 디렉토리로)
  Future<String> savePdfFile(String sourcePath, String fileName);
  
  /// PDF 파일 삭제
  Future<bool> deletePdfFile(String path);
} 