import '../entities/book.dart';
import '../repositories/book_repository.dart';
import 'package:just_one_ten_mins/core/usecase/usecase.dart';

/// 모든 도서 목록을 가져오는 유스케이스
class GetAllBooksUseCase implements UseCase<List<Book>, NoParams> {
  final BookRepository repository;

  GetAllBooksUseCase(this.repository);

  @override
  Future<List<Book>> call(NoParams params) {
    return repository.getAllBooks();
  }
} 