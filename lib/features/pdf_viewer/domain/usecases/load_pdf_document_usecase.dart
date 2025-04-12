import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import 'package:equatable/equatable.dart';
import '../entities/pdf_document.dart';
import '../repositories/pdf_repository.dart';

/// PDF 문서 로드 유스케이스
class LoadPdfDocumentUseCase implements UseCase<PdfDocument, LoadPdfParams> {
  final PdfRepository repository;

  LoadPdfDocumentUseCase(this.repository);

  @override
  Future<PdfDocument> call(LoadPdfParams params) {
    return repository.loadPdfDocument(params.path);
  }
}

/// PDF 로드를 위한 매개변수 클래스
class LoadPdfParams extends Equatable {
  final String path;

  const LoadPdfParams({required this.path});

  @override
  List<Object?> get props => [path];
} 