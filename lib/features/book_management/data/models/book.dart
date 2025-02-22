import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  @Collection()
  const factory Book({
    required Id id,
    required String title,
    required String author,
    String? coverUrl,
    required DateTime uploadedAt,
    required bool hasAudioSummary,
    String? summaryAudioPath,
    int? summaryDurationSeconds,
    @Default(false) bool isProcessing,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}