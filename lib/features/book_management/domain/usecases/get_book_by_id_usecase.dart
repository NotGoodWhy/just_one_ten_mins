import '../entities/book.dart';
import '../repositories/book_repository.dart';
import 'package:just_one_ten_mins/core/usecase/usecase.dart';

/// ID로 도서를 가져오는 유스케이스
class GetBookByIdUseCase implements UseCase<Book?, IdParams> {
  final BookRepository repository;

  GetBookByIdUseCase(this.repository);

  @override
  Future<Book?> call(IdParams params) {
    return repository.getBookById(params.id);
  }
} 