/// 도서 개체 클래스
class Book {
  final String id;
  final String title;
  final String author;
  final String? thumbnailUrl;
  final String? filePath;
  final DateTime addedDate;
  final bool isFavorite;
  final BookType type;
  final int? pageCount;
  final String? summary;
  final String? audioPath;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    this.thumbnailUrl,
    this.filePath,
    required this.addedDate,
    this.isFavorite = false,
    required this.type,
    this.pageCount,
    this.summary,
    this.audioPath,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? thumbnailUrl,
    String? filePath,
    DateTime? addedDate,
    bool? isFavorite,
    BookType? type,
    int? pageCount,
    String? summary,
    String? audioPath,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      filePath: filePath ?? this.filePath,
      addedDate: addedDate ?? this.addedDate,
      isFavorite: isFavorite ?? this.isFavorite,
      type: type ?? this.type,
      pageCount: pageCount ?? this.pageCount,
      summary: summary ?? this.summary,
      audioPath: audioPath ?? this.audioPath,
    );
  }
}

/// 도서 타입 열거형
enum BookType {
  pdf,
  scanned,
  other;
  
  String get displayName {
    switch (this) {
      case BookType.pdf:
        return 'PDF';
      case BookType.scanned:
        return '스캔';
      case BookType.other:
        return '기타';
    }
  }
} 