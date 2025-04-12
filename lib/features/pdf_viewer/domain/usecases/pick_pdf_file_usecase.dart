import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import '../repositories/pdf_repository.dart';

/// PDF 파일 선택 유스케이스
class PickPdfFileUseCase implements UseCase<String?, NoParams> {
  final PdfRepository repository;

  PickPdfFileUseCase(this.repository);

  @override
  Future<String?> call(NoParams params) {
    return repository.pickPdfFile();
  }
} 