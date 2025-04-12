import '../entities/book.dart';
import '../repositories/book_repository.dart';
import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import 'package:equatable/equatable.dart';

/// 도서를 저장하는 유스케이스
class SaveBookUseCase implements UseCase<void, SaveBookParams> {
  final BookRepository repository;

  SaveBookUseCase(this.repository);

  @override
  Future<void> call(SaveBookParams params) {
    return repository.saveBook(params.book);
  }
}

/// 도서 저장을 위한 매개변수 클래스
class SaveBookParams extends Equatable {
  final Book book;

  const SaveBookParams({required this.book});

  @override
  List<Object?> get props => [book];
} 