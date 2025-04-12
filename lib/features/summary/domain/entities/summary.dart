/// 요약 개체 클래스
class Summary {
  final String id;
  final String bookId;
  final String content;
  final DateTime createdAt;
  final int characterCount;
  final int? estimatedReadingTime;
  final int? estimatedSpeakingTime;

  const Summary({
    required this.id,
    required this.bookId,
    required this.content,
    required this.createdAt,
    required this.characterCount,
    this.estimatedReadingTime,
    this.estimatedSpeakingTime,
  });

  Summary copyWith({
    String? id,
    String? bookId,
    String? content,
    DateTime? createdAt,
    int? characterCount,
    int? estimatedReadingTime,
    int? estimatedSpeakingTime,
  }) {
    return Summary(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      characterCount: characterCount ?? this.characterCount,
      estimatedReadingTime: estimatedReadingTime ?? this.estimatedReadingTime,
      estimatedSpeakingTime: estimatedSpeakingTime ?? this.estimatedSpeakingTime,
    );
  }
} 