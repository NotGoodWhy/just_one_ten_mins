import 'package:just_one_ten_mins/features/audio_player/domain/entities/audio_track.dart';
import 'package:just_one_ten_mins/features/audio_player/domain/entities/player_state.dart';
import 'package:just_one_ten_mins/features/audio_player/domain/repositories/audio_player_repository.dart';
import 'package:just_one_ten_mins/features/audio_player/data/datasources/audio_player_local_datasource.dart';

/// 오디오 플레이어 리포지토리 구현체
class AudioPlayerRepositoryImpl implements AudioPlayerRepository {
  final AudioPlayerLocalDataSource localDataSource;

  AudioPlayerRepositoryImpl({required this.localDataSource});

  @override
  Future<void> loadTrack(AudioTrack track) => localDataSource.loadTrack(track);

  @override
  Future<void> play() => localDataSource.play();

  @override
  Future<void> pause() => localDataSource.pause();

  @override
  Future<void> stop() => localDataSource.stop();

  @override
  Future<void> seekTo(Duration position) => localDataSource.seekTo(position);

  @override
  Future<void> setSpeed(double speed) => localDataSource.setSpeed(speed);

  @override
  Future<void> setVolume(double volume) => localDataSource.setVolume(volume);

  @override
  Future<void> setLoopMode(LoopMode loopMode) => localDataSource.setLoopMode(loopMode);

  @override
  Future<void> setMuted(bool muted) => localDataSource.setMuted(muted);

  @override
  Stream<PlaybackState> get playbackStateStream => localDataSource.playbackStateStream;

  @override
  Stream<Duration> get positionStream => localDataSource.positionStream;

  @override
  Stream<Duration> get bufferedPositionStream => localDataSource.bufferedPositionStream;

  @override
  Future<List<AudioTrack>> getAudioTracks() => localDataSource.getAudioTracks();

  @override
  Future<void> saveAudioTrack(AudioTrack track) => localDataSource.saveAudioTrack(track);

  @override
  Future<void> deleteAudioTrack(String id) => localDataSource.deleteAudioTrack(id);

  @override
  Future<void> toggleFavorite(String id, bool isFavorite) => localDataSource.toggleFavorite(id, isFavorite);

  @override
  Future<void> saveLastPosition(String id, Duration position) => localDataSource.saveLastPosition(id, position);

  @override
  Future<void> dispose() => localDataSource.dispose();
} 