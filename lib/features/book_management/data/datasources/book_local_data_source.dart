import 'package:just_one_ten_mins/features/book_management/data/models/book_model.dart';
import 'package:just_one_ten_mins/features/book_management/domain/entities/book.dart';

/// 도서 로컬 데이터 소스 인터페이스
abstract class BookLocalDataSource {
  /// 모든 도서 목록 조회
  Future<List<BookModel>> getAllBooks();
  
  /// ID로 도서 조회
  Future<BookModel?> getBookById(String id);
  
  /// 도서 저장 (새로 추가 또는 업데이트)
  Future<void> saveBook(BookModel book);
  
  /// 도서 삭제
  Future<void> deleteBook(String id);
  
  /// 즐겨찾기 도서 목록 조회
  Future<List<BookModel>> getFavoriteBooks();
  
  /// 도서 타입별 도서 목록 조회
  Future<List<BookModel>> getBooksByType(BookType type);
  
  /// 도서를 즐겨찾기로 설정/해제
  Future<void> toggleFavorite(String id, bool isFavorite);
  
  /// 도서 요약본 업데이트
  Future<void> updateSummary(String id, String summary);
  
  /// 도서 오디오 경로 업데이트
  Future<void> updateAudioPath(String id, String audioPath);
} 