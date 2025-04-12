import 'package:get_it/get_it.dart';
import 'package:just_one_ten_mins/features/audio_player/data/datasources/audio_player_local_datasource.dart';
import 'package:just_one_ten_mins/features/audio_player/data/repositories/audio_player_repository_impl.dart';
import 'package:just_one_ten_mins/features/audio_player/domain/repositories/audio_player_repository.dart';
import 'package:just_one_ten_mins/features/audio_player/domain/usecases/get_audio_tracks_usecase.dart';
import 'package:just_one_ten_mins/features/audio_player/domain/usecases/load_and_play_track_usecase.dart';
import 'package:just_one_ten_mins/features/summary/data/datasources/summary_local_datasource.dart';
import 'package:just_one_ten_mins/features/summary/data/datasources/summary_remote_datasource.dart';
import 'package:just_one_ten_mins/features/summary/data/repositories/summary_repository_impl.dart';
import 'package:just_one_ten_mins/features/summary/domain/repositories/summary_repository.dart';
import 'package:just_one_ten_mins/features/summary/domain/usecases/generate_summary_usecase.dart';
import 'package:just_one_ten_mins/features/summary/domain/usecases/get_summary_by_bookid_usecase.dart';
import 'package:just_one_ten_mins/features/summary/domain/usecases/save_summary_usecase.dart';

/// GetIt 인스턴스
final getIt = GetIt.instance;

/// 의존성 등록
Future<void> setupServiceLocator() async {
  // Core
  
  // Features - Summary
  // Data sources
  getIt.registerLazySingleton<SummaryLocalDataSource>(
    () => throw UnimplementedError('SummaryLocalDataSource 구현 필요'),
  );
  getIt.registerLazySingleton<SummaryRemoteDataSource>(
    () => throw UnimplementedError('SummaryRemoteDataSource 구현 필요'),
  );
  
  // Repositories
  getIt.registerLazySingleton<SummaryRepository>(
    () => SummaryRepositoryImpl(
      localDataSource: getIt<SummaryLocalDataSource>(),
      remoteDataSource: getIt<SummaryRemoteDataSource>(),
    ),
  );
  
  // Use cases
  getIt.registerFactory<GetSummaryByBookIdUseCase>(
    () => GetSummaryByBookIdUseCase(getIt<SummaryRepository>()),
  );
  getIt.registerFactory<GenerateSummaryUseCase>(
    () => GenerateSummaryUseCase(getIt<SummaryRepository>()),
  );
  getIt.registerFactory<SaveSummaryUseCase>(
    () => SaveSummaryUseCase(getIt<SummaryRepository>()),
  );
  
  // Features - Audio Player
  // Data sources
  getIt.registerLazySingleton<AudioPlayerLocalDataSource>(
    () => AudioPlayerLocalDataSourceImpl(),
  );
  
  // Repositories
  getIt.registerLazySingleton<AudioPlayerRepository>(
    () => AudioPlayerRepositoryImpl(
      localDataSource: getIt<AudioPlayerLocalDataSource>(),
    ),
  );
  
  // Use cases
  getIt.registerFactory<GetAudioTracksUseCase>(
    () => GetAudioTracksUseCase(getIt<AudioPlayerRepository>()),
  );
  getIt.registerFactory<LoadAndPlayTrackUseCase>(
    () => LoadAndPlayTrackUseCase(getIt<AudioPlayerRepository>()),
  );
} 