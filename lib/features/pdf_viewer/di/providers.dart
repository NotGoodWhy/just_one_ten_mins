import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/data/datasources/pdf_file_data_source.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/data/datasources/pdf_file_data_source_impl.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/data/repositories/pdf_repository_impl.dart';
import 'package:just_one_ten_mins/features/pdf_viewer/domain/repositories/pdf_repository.dart';

/// PDF 파일 데이터 소스 프로바이더
final pdfFileDataSourceProvider = Provider<PdfFileDataSource>((ref) {
  return PdfFileDataSourceImpl();
});

/// PDF 레포지토리 프로바이더
final pdfRepositoryProvider = Provider<PdfRepository>((ref) {
  final dataSource = ref.watch(pdfFileDataSourceProvider);
  return PdfRepositoryImpl(dataSource);
}); 