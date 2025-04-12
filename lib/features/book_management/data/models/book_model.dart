import 'package:just_one_ten_mins/features/book_management/domain/entities/book.dart';

/// 도서 모델 클래스 (데이터 레이어)
class BookModel extends Book {
  const BookModel({
    required String id,
    required String title,
    required String author,
    String? thumbnailUrl,
    String? filePath,
    required DateTime addedDate,
    bool isFavorite = false,
    required BookType type,
    int? pageCount,
    String? summary,
    String? audioPath,
  }) : super(
          id: id,
          title: title,
          author: author,
          thumbnailUrl: thumbnailUrl,
          filePath: filePath,
          addedDate: addedDate,
          isFavorite: isFavorite,
          type: type,
          pageCount: pageCount,
          summary: summary,
          audioPath: audioPath,
        );

  /// JSON에서 BookModel 인스턴스 생성
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      filePath: json['filePath'] as String?,
      addedDate: DateTime.parse(json['addedDate'] as String),
      isFavorite: json['isFavorite'] as bool? ?? false,
      type: BookType.values.firstWhere(
        (e) => e.name == (json['type'] as String),
        orElse: () => BookType.other,
      ),
      pageCount: json['pageCount'] as int?,
      summary: json['summary'] as String?,
      audioPath: json['audioPath'] as String?,
    );
  }

  /// BookModel을 JSON 형태로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'thumbnailUrl': thumbnailUrl,
      'filePath': filePath,
      'addedDate': addedDate.toIso8601String(),
      'isFavorite': isFavorite,
      'type': type.name,
      'pageCount': pageCount,
      'summary': summary,
      'audioPath': audioPath,
    };
  }

  /// Book 엔티티에서 BookModel 생성
  factory BookModel.fromEntity(Book book) {
    return BookModel(
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
      audioPath: book.audioPath,
    );
  }
} 