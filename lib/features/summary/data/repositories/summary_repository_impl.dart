import 'package:just_one_ten_mins/core/error/exceptions.dart';
import 'package:just_one_ten_mins/features/summary/data/datasources/summary_local_datasource.dart';
import 'package:just_one_ten_mins/features/summary/data/datasources/summary_remote_datasource.dart';
import 'package:just_one_ten_mins/features/summary/data/models/summary_model.dart';
import 'package:just_one_ten_mins/features/summary/domain/entities/summary.dart';
import 'package:just_one_ten_mins/features/summary/domain/repositories/summary_repository.dart';
import 'package:uuid/uuid.dart';

/// 요약 레포지토리 구현체
class SummaryRepositoryImpl implements SummaryRepository {
  final SummaryLocalDataSource localDataSource;
  final SummaryRemoteDataSource remoteDataSource;

  SummaryRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Summary?> getSummaryByBookId(String bookId) async {
    try {
      final summaryModel = await localDataSource.getSummaryByBookId(bookId);
      return summaryModel;
    } catch (e) {
      throw LocalDatabaseException('요약본을 조회하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<void> saveSummary(Summary summary) async {
    try {
      final summaryModel = SummaryModel.fromEntity(summary);
      await localDataSource.saveSummary(summaryModel);
    } catch (e) {
      throw LocalDatabaseException('요약본을 저장하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<void> deleteSummary(String id) async {
    try {
      await localDataSource.deleteSummary(id);
    } catch (e) {
      throw LocalDatabaseException('요약본을 삭제하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<String> generateSummary(String bookId, List<String> textContent) async {
    try {
      final summaryContent = await remoteDataSource.generateSummary(textContent);
      return summaryContent;
    } catch (e) {
      throw ServerException('AI로 요약본을 생성하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<String> generateAudio(String summaryId) async {
    try {
      final summary = await localDataSource.getSummaryByBookId(summaryId);
      if (summary == null) {
        throw LocalDatabaseException('요약본을 찾을 수 없습니다.');
      }
      
      final audioPath = await remoteDataSource.generateAudio(summary.content);
      return audioPath;
    } catch (e) {
      throw ServerException('요약본을 음성으로 변환하는 중 오류가 발생했습니다: $e');
    }
  }

  @override
  Future<Map<String, int>> calculateEstimatedTimes(String content) async {
    try {
      return await remoteDataSource.calculateEstimatedTimes(content);
    } catch (e) {
      throw ServerException('예상 시간을 계산하는 중 오류가 발생했습니다: $e');
    }
  }
} 