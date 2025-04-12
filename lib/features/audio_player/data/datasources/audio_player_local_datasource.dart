import 'package:just_audio/just_audio.dart' hide LoopMode;
import 'package:just_audio/just_audio.dart' as just_audio show LoopMode;
import 'package:just_one_ten_mins/features/audio_player/domain/entities/audio_track.dart';
import 'package:just_one_ten_mins/features/audio_player/domain/entities/player_state.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

/// 오디오 플레이어 로컬 데이터 소스 인터페이스
abstract class AudioPlayerLocalDataSource {
  /// 오디오 트랙 로드
  Future<void> loadTrack(AudioTrack track);
  
  /// 오디오 트랙 재생
  Future<void> play();
  
  /// 오디오 트랙 일시정지
  Future<void> pause();
  
  /// 오디오 트랙 정지
  Future<void> stop();
  
  /// 특정 위치로 이동
  Future<void> seekTo(Duration position);
  
  /// 재생 속도 설정
  Future<void> setSpeed(double speed);
  
  /// 볼륨 설정
  Future<void> setVolume(double volume);
  
  /// 반복 모드 설정
  Future<void> setLoopMode(LoopMode loopMode);
  
  /// 음소거 설정
  Future<void> setMuted(bool muted);
  
  /// 현재 재생 상태 가져오기
  Stream<PlaybackState> get playbackStateStream;
  
  /// 현재 재생 위치 가져오기
  Stream<Duration> get positionStream;
  
  /// 현재 버퍼링 위치 가져오기
  Stream<Duration> get bufferedPositionStream;
  
  /// 오디오 트랙 목록 로드
  Future<List<AudioTrack>> getAudioTracks();
  
  /// 오디오 트랙 저장
  Future<void> saveAudioTrack(AudioTrack track);
  
  /// 오디오 트랙 삭제
  Future<void> deleteAudioTrack(String id);
  
  /// 오디오 트랙 즐겨찾기 설정
  Future<void> toggleFavorite(String id, bool isFavorite);
  
  /// 마지막 재생 위치 저장
  Future<void> saveLastPosition(String id, Duration position);
  
  /// 플레이어 정리
  Future<void> dispose();
}

/// 오디오 플레이어 로컬 데이터 소스 구현체
class AudioPlayerLocalDataSourceImpl implements AudioPlayerLocalDataSource {
  final AudioPlayer _audioPlayer;
  
  AudioPlayerLocalDataSourceImpl({AudioPlayer? audioPlayer})
      : _audioPlayer = audioPlayer ?? AudioPlayer();
  
  @override
  Future<void> loadTrack(AudioTrack track) async {
    if (track.filePath != null) {
      await _audioPlayer.setFilePath(track.filePath!);
    } else if (track.url != null) {
      await _audioPlayer.setUrl(track.url!);
    }
  }
  
  @override
  Future<void> play() => _audioPlayer.play();
  
  @override
  Future<void> pause() => _audioPlayer.pause();
  
  @override
  Future<void> stop() => _audioPlayer.stop();
  
  @override
  Future<void> seekTo(Duration position) => _audioPlayer.seek(position);
  
  @override
  Future<void> setSpeed(double speed) => _audioPlayer.setSpeed(speed);
  
  @override
  Future<void> setVolume(double volume) => _audioPlayer.setVolume(volume);
  
  @override
  Future<void> setLoopMode(LoopMode loopMode) {
    return _audioPlayer.setLoopMode(
      loopMode == LoopMode.off 
        ? just_audio.LoopMode.off 
        : loopMode == LoopMode.one 
          ? just_audio.LoopMode.one 
          : just_audio.LoopMode.all
    );
  }
  
  @override
  Future<void> setMuted(bool muted) async {
    if (muted) {
      await _audioPlayer.setVolume(0);
    } else {
      await _audioPlayer.setVolume(1.0);
    }
  }
  
  @override
  Stream<PlaybackState> get playbackStateStream => 
      _audioPlayer.playerStateStream.map((state) {
        final isPlaying = state.playing;
        final processingState = state.processingState;
        
        if (processingState == ProcessingState.loading || 
            processingState == ProcessingState.buffering) {
          return PlaybackState.buffering;
        } else if (!isPlaying) {
          return PlaybackState.paused;
        } else if (processingState == ProcessingState.completed) {
          return PlaybackState.completed;
        } else {
          return PlaybackState.playing;
        }
      });
  
  @override
  Stream<Duration> get positionStream => _audioPlayer.positionStream;
  
  @override
  Stream<Duration> get bufferedPositionStream => _audioPlayer.bufferedPositionStream;
  
  @override
  Future<List<AudioTrack>> getAudioTracks() async {
    // 여기서는 구현이 필요합니다. 예를 들어 파일 시스템이나 데이터베이스에서 트랙을 로드할 수 있습니다.
    return [];
  }
  
  @override
  Future<void> saveAudioTrack(AudioTrack track) async {
    // 구현 필요
  }
  
  @override
  Future<void> deleteAudioTrack(String id) async {
    // 구현 필요
  }
  
  @override
  Future<void> toggleFavorite(String id, bool isFavorite) async {
    // 구현 필요
  }
  
  @override
  Future<void> saveLastPosition(String id, Duration position) async {
    // 구현 필요
  }
  
  @override
  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
} 