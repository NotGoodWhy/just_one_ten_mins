import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_one_ten_mins/features/summary/data/datasources/summary_local_datasource.dart';
import 'package:just_one_ten_mins/features/summary/data/datasources/summary_remote_datasource.dart';
import 'package:just_one_ten_mins/features/summary/data/repositories/summary_repository_impl.dart';
import 'package:just_one_ten_mins/features/summary/domain/repositories/summary_repository.dart';

/// 요약 로컬 데이터 소스 프로바이더
final summaryLocalDataSourceProvider = Provider<SummaryLocalDataSource>((ref) {
  // SummaryLocalDataSourceImpl 구현체를 여기서 제공
  return throw UnimplementedError('SummaryLocalDataSource 구현 필요');
});

/// 요약 원격 데이터 소스 프로바이더
final summaryRemoteDataSourceProvider = Provider<SummaryRemoteDataSource>((ref) {
  // SummaryRemoteDataSourceImpl 구현체를 여기서 제공
  return throw UnimplementedError('SummaryRemoteDataSource 구현 필요');
});

/// 요약 레포지토리 프로바이더
final summaryRepositoryProvider = Provider<SummaryRepository>((ref) {
  final localDataSource = ref.watch(summaryLocalDataSourceProvider);
  final remoteDataSource = ref.watch(summaryRemoteDataSourceProvider);
  
  return SummaryRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
}); 