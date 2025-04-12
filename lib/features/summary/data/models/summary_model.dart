import 'package:just_one_ten_mins/features/summary/domain/entities/summary.dart';

/// 요약 모델 클래스 (데이터 레이어)
class SummaryModel extends Summary {
  const SummaryModel({
    required String id,
    required String bookId,
    required String content,
    required DateTime createdAt,
    required int characterCount,
    int? estimatedReadingTime,
    int? estimatedSpeakingTime,
  }) : super(
          id: id,
          bookId: bookId,
          content: content,
          createdAt: createdAt,
          characterCount: characterCount,
          estimatedReadingTime: estimatedReadingTime,
          estimatedSpeakingTime: estimatedSpeakingTime,
        );

  /// JSON에서 SummaryModel 인스턴스 생성
  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      id: json['id'] as String,
      bookId: json['bookId'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      characterCount: json['characterCount'] as int,
      estimatedReadingTime: json['estimatedReadingTime'] as int?,
      estimatedSpeakingTime: json['estimatedSpeakingTime'] as int?,
    );
  }

  /// SummaryModel을 JSON 형태로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookId': bookId,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'characterCount': characterCount,
      'estimatedReadingTime': estimatedReadingTime,
      'estimatedSpeakingTime': estimatedSpeakingTime,
    };
  }

  /// Summary 엔티티에서 SummaryModel 생성
  factory SummaryModel.fromEntity(Summary summary) {
    return SummaryModel(
      id: summary.id,
      bookId: summary.bookId,
      content: summary.content,
      createdAt: summary.createdAt,
      characterCount: summary.characterCount,
      estimatedReadingTime: summary.estimatedReadingTime,
      estimatedSpeakingTime: summary.estimatedSpeakingTime,
    );
  }
}