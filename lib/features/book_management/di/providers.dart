import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_one_ten_mins/features/book_management/data/datasources/book_local_data_source.dart';
import 'package:just_one_ten_mins/features/book_management/data/datasources/book_local_data_source_impl.dart';
import 'package:just_one_ten_mins/features/book_management/data/repositories/book_repository_impl.dart';
import 'package:just_one_ten_mins/features/book_management/domain/repositories/book_repository.dart';

/// 도서 로컬 데이터 소스 프로바이더
final bookLocalDataSourceProvider = Provider<BookLocalDataSource>((ref) {
  return BookLocalDataSourceImpl();
});

/// 도서 레포지토리 프로바이더
final bookRepositoryProvider = Provider<BookRepository>((ref) {
  final localDataSource = ref.watch(bookLocalDataSourceProvider);
  return BookRepositoryImpl(localDataSource: localDataSource);
}); 