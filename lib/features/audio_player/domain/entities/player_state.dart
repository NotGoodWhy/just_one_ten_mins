import 'audio_track.dart';

/// 재생 상태를 나타내는 열거형
enum PlaybackState {
  /// 초기 상태
  initial,
  
  /// 재생 중
  playing,
  
  /// 일시 정지됨
  paused,
  
  /// 버퍼링 중
  buffering,
  
  /// 재생 완료됨
  completed,
  
  /// 에러 발생
  error
}

/// 반복 모드를 나타내는 열거형
enum LoopMode {
  /// 반복 없음
  off,
  
  /// 한 트랙 반복
  one,
  
  /// 전체 반복
  all
}

/// 오디오 플레이어 상태 개체
class PlayerState {
  final AudioTrack? currentTrack;
  final List<AudioTrack> playlist;
  final PlaybackState playbackState;
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
  final double speed;
  final double volume;
  final LoopMode loopMode;
  final bool isMuted;
  final String? errorMessage;

  const PlayerState({
    this.currentTrack,
    this.playlist = const [],
    this.playbackState = PlaybackState.initial,
    this.position = Duration.zero,
    this.bufferedPosition = Duration.zero,
    this.duration = Duration.zero,
    this.speed = 1.0,
    this.volume = 1.0,
    this.loopMode = LoopMode.off,
    this.isMuted = false,
    this.errorMessage,
  });

  PlayerState copyWith({
    AudioTrack? currentTrack,
    List<AudioTrack>? playlist,
    PlaybackState? playbackState,
    Duration? position,
    Duration? bufferedPosition,
    Duration? duration,
    double? speed,
    double? volume,
    LoopMode? loopMode,
    bool? isMuted,
    String? errorMessage,
  }) {
    return PlayerState(
      currentTrack: currentTrack ?? this.currentTrack,
      playlist: playlist ?? this.playlist,
      playbackState: playbackState ?? this.playbackState,
      position: position ?? this.position,
      bufferedPosition: bufferedPosition ?? this.bufferedPosition,
      duration: duration ?? this.duration,
      speed: speed ?? this.speed,
      volume: volume ?? this.volume,
      loopMode: loopMode ?? this.loopMode,
      isMuted: isMuted ?? this.isMuted,
      errorMessage: errorMessage,
    );
  }
} 