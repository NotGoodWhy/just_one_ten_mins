import 'package:just_one_ten_mins/core/error/exceptions.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/data/datasources/pdf_file_data_source.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/domain/entities/pdf_document.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/domain/repositories/pdf_repository.dart';

/// PDF 레포지토리 구현체
class PdfRepositoryImpl implements PdfRepository {
  final PdfFileDataSource dataSource;

  PdfRepositoryImpl(this.dataSource);

  @override
  Future<String?> pickPdfFile() async {
    try {
      return await dataSource.pickPdfFile();
    } catch (e) {
      throw FileException('PDF 파일을 선택하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<PdfDocument> loadPdfDocument(String path) async {
    try {
      return await dataSource.loadPdfDocument(path);
    } catch (e) {
      throw FileException('PDF 파일을 로드하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<List<String>> extractText(String path) async {
    try {
      return await dataSource.extractText(path);
    } catch (e) {
      throw FileException('PDF 텍스트를 추출하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<int> getPageCount(String path) async {
    try {
      return await dataSource.getPageCount(path);
    } catch (e) {
      throw FileException('PDF 페이지 수를 가져오는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<String> savePdfFile(String sourcePath, String fileName) async {
    try {
      return await dataSource.savePdfFile(sourcePath, fileName);
    } catch (e) {
      throw FileException('PDF 파일을 저장하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<bool> deletePdfFile(String path) async {
    try {
      return await dataSource.deletePdfFile(path);
    } catch (e) {
      throw FileException('PDF 파일을 삭제하는 중 오류가 발생했습니다: $e');
    }
  }
} 