// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String? get coverUrl => throw _privateConstructorUsedError;
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  bool get hasAudioSummary => throw _privateConstructorUsedError;
  String? get summaryAudioPath => throw _privateConstructorUsedError;
  int? get summaryDurationSeconds => throw _privateConstructorUsedError;
  bool get isProcessing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {int id,
      String title,
      String author,
      String? coverUrl,
      DateTime uploadedAt,
      bool hasAudioSummary,
      String? summaryAudioPath,
      int? summaryDurationSeconds,
      bool isProcessing});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? coverUrl = freezed,
    Object? uploadedAt = null,
    Object? hasAudioSummary = null,
    Object? summaryAudioPath = freezed,
    Object? summaryDurationSeconds = freezed,
    Object? isProcessing = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasAudioSummary: null == hasAudioSummary
          ? _value.hasAudioSummary
          : hasAudioSummary // ignore: cast_nullable_to_non_nullable
              as bool,
      summaryAudioPath: freezed == summaryAudioPath
          ? _value.summaryAudioPath
          : summaryAudioPath // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryDurationSeconds: freezed == summaryDurationSeconds
          ? _value.summaryDurationSeconds
          : summaryDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String author,
      String? coverUrl,
      DateTime uploadedAt,
      bool hasAudioSummary,
      String? summaryAudioPath,
      int? summaryDurationSeconds,
      bool isProcessing});
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? coverUrl = freezed,
    Object? uploadedAt = null,
    Object? hasAudioSummary = null,
    Object? summaryAudioPath = freezed,
    Object? summaryDurationSeconds = freezed,
    Object? isProcessing = null,
  }) {
    return _then(_$BookImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasAudioSummary: null == hasAudioSummary
          ? _value.hasAudioSummary
          : hasAudioSummary // ignore: cast_nullable_to_non_nullable
              as bool,
      summaryAudioPath: freezed == summaryAudioPath
          ? _value.summaryAudioPath
          : summaryAudioPath // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryDurationSeconds: freezed == summaryDurationSeconds
          ? _value.summaryDurationSeconds
          : summaryDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Collection()
class _$BookImpl implements _Book {
  const _$BookImpl(
      {required this.id,
      required this.title,
      required this.author,
      this.coverUrl,
      required this.uploadedAt,
      required this.hasAudioSummary,
      this.summaryAudioPath,
      this.summaryDurationSeconds,
      this.isProcessing = false});

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String author;
  @override
  final String? coverUrl;
  @override
  final DateTime uploadedAt;
  @override
  final bool hasAudioSummary;
  @override
  final String? summaryAudioPath;
  @override
  final int? summaryDurationSeconds;
  @override
  @JsonKey()
  final bool isProcessing;

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, coverUrl: $coverUrl, uploadedAt: $uploadedAt, hasAudioSummary: $hasAudioSummary, summaryAudioPath: $summaryAudioPath, summaryDurationSeconds: $summaryDurationSeconds, isProcessing: $isProcessing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.hasAudioSummary, hasAudioSummary) ||
                other.hasAudioSummary == hasAudioSummary) &&
            (identical(other.summaryAudioPath, summaryAudioPath) ||
                other.summaryAudioPath == summaryAudioPath) &&
            (identical(other.summaryDurationSeconds, summaryDurationSeconds) ||
                other.summaryDurationSeconds == summaryDurationSeconds) &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      author,
      coverUrl,
      uploadedAt,
      hasAudioSummary,
      summaryAudioPath,
      summaryDurationSeconds,
      isProcessing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {required final int id,
      required final String title,
      required final String author,
      final String? coverUrl,
      required final DateTime uploadedAt,
      required final bool hasAudioSummary,
      final String? summaryAudioPath,
      final int? summaryDurationSeconds,
      final bool isProcessing}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get author;
  @override
  String? get coverUrl;
  @override
  DateTime get uploadedAt;
  @override
  bool get hasAudioSummary;
  @override
  String? get summaryAudioPath;
  @override
  int? get summaryDurationSeconds;
  @override
  bool get isProcessing;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
