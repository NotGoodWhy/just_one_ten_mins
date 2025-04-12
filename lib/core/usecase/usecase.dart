import 'package:equatable/equatable.dart';

/// 유스케이스 인터페이스
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

/// 매개변수가 필요 없는 유스케이스를 위한 클래스
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

/// ID 매개변수를 위한 클래스
class IdParams extends Equatable {
  final String id;

  const IdParams({required this.id});

  @override
  List<Object?> get props => [id];
}

/// 페이지네이션 매개변수를 위한 클래스
class PaginationParams extends Equatable {
  final int page;
  final int limit;

  const PaginationParams({
    this.page = 1,
    this.limit = 20,
  });

  @override
  List<Object?> get props => [page, limit];
}

/// 검색 매개변수를 위한 클래스
class SearchParams extends Equatable {
  final String query;
  final int? limit;

  const SearchParams({
    required this.query,
    this.limit,
  });

  @override
  List<Object?> get props => [query, limit];
} 