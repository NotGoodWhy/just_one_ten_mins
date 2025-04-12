import 'package:isar/isar.dart';
import 'package:just_one_ten_mins/features/book_management/data/datasources/book_local_data_source.dart';
import 'package:just_one_ten_mins/features/book_management/data/models/book_model.dart';
import 'package:just_one_ten_mins/features/book_management/domain/entities/book.dart';
import 'package:path_provider/path_provider.dart';
import 'package:just_one_ten_mins/core/error/exceptions.dart';

/// Isar 데이터베이스를 사용한 도서 로컬 데이터 소스 구현체
class BookLocalDataSourceImpl implements BookLocalDataSource {
  late Future<Isar> _db;

  BookLocalDataSourceImpl() {
    _db = _openDb();
  }

  /// Isar 데이터베이스 초기화
  Future<Isar> _openDb() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [BookModelSchema],
        directory: dir.path,
        name: 'books',
      );
    }
    return Future.value(Isar.getInstance('books'));
  }

  @override
  Future<List<BookModel>> getAllBooks() async {
    try {
      final isar = await _db;
      return await isar.bookModels.where().findAll();
    } catch (e) {
      throw LocalDatabaseException('도서 목록을 조회하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<BookModel?> getBookById(String id) async {
    try {
      final isar = await _db;
      return await isar.bookModels.filter().idEqualTo(id).findFirst();
    } catch (e) {
      throw LocalDatabaseException('도서를 조회하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<void> saveBook(BookModel book) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        await isar.bookModels.put(book);
      });
    } catch (e) {
      throw LocalDatabaseException('도서를 저장하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<void> deleteBook(String id) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        final success = await isar.bookModels.filter().idEqualTo(id).deleteFirst();
        if (!success) {
          throw LocalDatabaseException('삭제할 도서를 찾을 수 없습니다: $id');
        }
      });
    } catch (e) {
      throw LocalDatabaseException('도서를 삭제하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<List<BookModel>> getFavoriteBooks() async {
    try {
      final isar = await _db;
      return await isar.bookModels.filter().isFavoriteEqualTo(true).findAll();
    } catch (e) {
      throw LocalDatabaseException('즐겨찾기 도서 목록을 조회하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<List<BookModel>> getBooksByType(BookType type) async {
    try {
      final isar = await _db;
      return await isar.bookModels
          .filter()
          .typeEqualTo(type.name)
          .findAll();
    } catch (e) {
      throw LocalDatabaseException('도서 타입별 목록을 조회하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<void> toggleFavorite(String id, bool isFavorite) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        final book = await isar.bookModels.filter().idEqualTo(id).findFirst();
        if (book == null) {
          throw LocalDatabaseException('도서를 찾을 수 없습니다: $id');
        }
        
        final updatedBook = BookModel(
          id: book.id,
          title: book.title,
          author: book.author,
          thumbnailUrl: book.thumbnailUrl,
          filePath: book.filePath,
          addedDate: book.addedDate,
          isFavorite: isFavorite,
          type: book.type,
          pageCount: book.pageCount,
          summary: book.summary,
          audioPath: book.audioPath,
        );
        
        await isar.bookModels.put(updatedBook);
      });
    } catch (e) {
      throw LocalDatabaseException('즐겨찾기 상태를 변경하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<void> updateSummary(String id, String summary) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        final book = await isar.bookModels.filter().idEqualTo(id).findFirst();
        if (book == null) {
          throw LocalDatabaseException('도서를 찾을 수 없습니다: $id');
        }
        
        final updatedBook = BookModel(
          id: book.id,
          title: book.title,
          author: book.author,
          thumbnailUrl: book.thumbnailUrl,
          filePath: book.filePath,
          addedDate: book.addedDate,
          isFavorite: book.isFavorite,
          type: book.type,
          pageCount: book.pageCount,
          summary: summary,
          audioPath: book.audioPath,
        );
        
        await isar.bookModels.put(updatedBook);
      });
    } catch (e) {
      throw LocalDatabaseException('요약을 업데이트하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<void> updateAudioPath(String id, String audioPath) async {
    try {
      final isar = await _db;
      await isar.writeTxn(() async {
        final book = await isar.bookModels.filter().idEqualTo(id).findFirst();
        if (book == null) {
          throw LocalDatabaseException('도서를 찾을 수 없습니다: $id');
        }
        
        final updatedBook = BookModel(
          id: book.id,
          title: book.title,
          author: book.author,
          thumbnailUrl: book.thumbnailUrl,
          filePath: book.filePath,
          addedDate: book.addedDate,
          isFavorite: book.isFavorite,
          type: book.type,
          pageCount: book.pageCount,
          summary: book.summary,
          audioPath: audioPath,
        );
        
        await isar.bookModels.put(updatedBook);
      });
    } catch (e) {
      throw LocalDatabaseException('오디오 경로를 업데이트하는 중 오류가 발생했습니다: $e');
    }
  }
} 