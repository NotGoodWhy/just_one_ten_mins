import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:pdf_text/pdf_text.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:just_one_ten_mins/core/error/exceptions.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/data/datasources/pdf_file_data_source.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/domain/entities/pdf_document.dart';

/// PDF 파일 데이터 소스 구현체
class PdfFileDataSourceImpl implements PdfFileDataSource {
  @override
  Future<String?> pickPdfFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files.first.path;
      } else {
        return null;
      }
    } catch (e) {
      throw FileException('PDF 파일을 선택하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<PdfDocument> loadPdfDocument(String path) async {
    try {
      final file = File(path);
      if (!file.existsSync()) {
        throw FileException('파일이 존재하지 않습니다: $path');
      }

      final pdfDoc = await PDFDoc.fromPath(path);
      final name = this._getFileName(path);
      final pageCount = pdfDoc.length;
      final id = const Uuid().v4();

      return PdfDocument(
        id: id,
        path: path,
        name: name,
        pageCount: pageCount,
        lastOpenedAt: DateTime.now(),
      );
    } catch (e) {
      throw FileException('PDF 파일을 로드하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<List<String>> extractText(String path) async {
    try {
      final file = File(path);
      if (!file.existsSync()) {
        throw FileException('파일이 존재하지 않습니다: $path');
      }

      final pdfDoc = await PDFDoc.fromPath(path);
      final List<String> pageTexts = [];

      for (int i = 0; i < pdfDoc.length; i++) {
        final page = await pdfDoc.getPage(i + 1);
        final text = await page.text;
        pageTexts.add(text);
      }

      return pageTexts;
    } catch (e) {
      throw FileException('PDF 텍스트를 추출하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<int> getPageCount(String path) async {
    try {
      final file = File(path);
      if (!file.existsSync()) {
        throw FileException('파일이 존재하지 않습니다: $path');
      }

      final pdfDoc = await PDFDoc.fromPath(path);
      return pdfDoc.length;
    } catch (e) {
      throw FileException('PDF 페이지 수를 가져오는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<String> savePdfFile(String sourcePath, String fileName) async {
    try {
      final sourceFile = File(sourcePath);
      if (!sourceFile.existsSync()) {
        throw FileException('원본 파일이 존재하지 않습니다: $sourcePath');
      }

      final appDir = await getApplicationDocumentsDirectory();
      final pdfsDir = Directory('${appDir.path}/pdfs');
      
      if (!pdfsDir.existsSync()) {
        pdfsDir.createSync(recursive: true);
      }

      final targetPath = '${pdfsDir.path}/${_generateUniqueFileName(fileName)}';
      await sourceFile.copy(targetPath);

      return targetPath;
    } catch (e) {
      throw FileException('PDF 파일을 저장하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<bool> deletePdfFile(String path) async {
    try {
      final file = File(path);
      if (!file.existsSync()) {
        return false;
      }

      await file.delete();
      return true;
    } catch (e) {
      throw FileException('PDF 파일을 삭제하는 중 오류가 발생했습니다: $e');
    }
  }

  /// 파일 경로에서 파일 이름 추출
  String _getFileName(String filePath) {
    try {
      return path.basename(filePath);
    } catch (e) {
      return filePath.split('/').last;
    }
  }

  /// 고유한 파일 이름 생성 (동일 이름 충돌 방지)
  String _generateUniqueFileName(String fileName) {
    final fileNameWithoutExt = path.basenameWithoutExtension(fileName);
    final ext = path.extension(fileName);
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    
    return '$fileNameWithoutExt-$timestamp$ext';
  }
} 