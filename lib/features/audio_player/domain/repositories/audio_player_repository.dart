import '../entities/audio_track.dart';
import '../entities/player_state.dart';

/// 오디오 플레이어 레포지토리 인터페이스
abstract class AudioPlayerRepository {
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