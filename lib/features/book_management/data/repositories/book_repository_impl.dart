import 'package:just_one_ten_mins/features/book_management/data/datasources/book_local_data_source.dart';
import 'package:just_one_ten_mins/features/book_management/data/models/book_model.dart';
import 'package:just_one_ten_mins/features/book_management/domain/entities/book.dart';
import 'package:just_one_ten_mins/features/book_management/domain/repositories/book_repository.dart';

/// 도서 레포지토리 구현체
class BookRepositoryImpl implements BookRepository {
  final BookLocalDataSource localDataSource;

  BookRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Book>> getAllBooks() async {
    final bookModels = await localDataSource.getAllBooks();
    return bookModels;
  }

  @override
  Future<Book?> getBookById(String id) async {
    return await localDataSource.getBookById(id);
  }

  @override
  Future<void> saveBook(Book book) async {
    final bookModel = BookModel.fromEntity(book);
    await localDataSource.saveBook(bookModel);
  }

  @override
  Future<void> deleteBook(String id) async {
    await localDataSource.deleteBook(id);
  }

  @override
  Future<List<Book>> getFavoriteBooks() async {
    final bookModels = await localDataSource.getFavoriteBooks();
    return bookModels;
  }

  @override
  Future<List<Book>> getBooksByType(BookType type) async {
    final bookModels = await localDataSource.getBooksByType(type);
    return bookModels;
  }

  @override
  Future<void> toggleFavorite(String id, bool isFavorite) async {
    await localDataSource.toggleFavorite(id, isFavorite);
  }

  @override
  Future<void> updateSummary(String id, String summary) async {
    await localDataSource.updateSummary(id, summary);
  }

  @override
  Future<void> updateAudioPath(String id, String audioPath) async {
    await localDataSource.updateAudioPath(id, audioPath);
  }
} 