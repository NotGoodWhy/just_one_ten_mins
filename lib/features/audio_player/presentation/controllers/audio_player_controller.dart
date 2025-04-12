import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import 'package:just_one_ten_mins/features/audio_player/domain/entities/audio_track.dart';
import 'package:just_one_ten_mins/features/audio_player/domain/entities/player_state.dart' as entity;
import 'package:just_one_ten_mins/features/audio_player/domain/repositories/audio_player_repository.dart';
import 'package:just_one_ten_mins/features/audio_player/domain/usecases/get_audio_tracks_usecase.dart';
import 'package:just_one_ten_mins/features/audio_player/domain/usecases/load_and_play_track_usecase.dart';

/// 오디오 플레이어 컨트롤러 (Riverpod)
class AudioPlayerController extends StateNotifier<entity.PlayerState> {
  final AudioPlayerRepository repository;
  final LoadAndPlayTrackUseCase loadAndPlayTrackUseCase;
  final GetAudioTracksUseCase getAudioTracksUseCase;

  AudioPlayerController({
    required this.repository,
    required this.loadAndPlayTrackUseCase,
    required this.getAudioTracksUseCase,
  }) : super(const entity.PlayerState()) {
    _init();
  }

  /// 초기화
  void _init() {
    // 스트림 구독
    repository.playbackStateStream.listen(_onPlaybackStateChanged);
    repository.positionStream.listen(_onPositionChanged);
    repository.bufferedPositionStream.listen(_onBufferedPositionChanged);
    
    // 트랙 목록 로드
    loadTracks();
  }

  /// 트랙 목록 로드
  Future<void> loadTracks() async {
    try {
      final tracks = await getAudioTracksUseCase(NoParams());
      state = state.copyWith(playlist: tracks);
    } catch (e) {
      state = state.copyWith(
        errorMessage: '오디오 트랙 목록을 불러오는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 재생 상태 변경 처리
  void _onPlaybackStateChanged(entity.PlaybackState playbackState) {
    state = state.copyWith(playbackState: playbackState);
  }

  /// 재생 위치 변경 처리
  void _onPositionChanged(Duration position) {
    state = state.copyWith(position: position);
  }

  /// 버퍼링 위치 변경 처리
  void _onBufferedPositionChanged(Duration bufferedPosition) {
    state = state.copyWith(bufferedPosition: bufferedPosition);
  }

  /// 트랙 로드 및 재생
  Future<void> loadAndPlayTrack(AudioTrack track) async {
    try {
      await loadAndPlayTrackUseCase(LoadTrackParams(track: track));
      state = state.copyWith(
        currentTrack: track,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: '오디오 트랙을 재생하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 재생/일시정지 토글
  Future<void> togglePlayPause() async {
    if (state.playbackState.isPlaying) {
      await pause();
    } else {
      await play();
    }
  }

  /// 재생
  Future<void> play() async {
    try {
      await repository.play();
    } catch (e) {
      state = state.copyWith(
        errorMessage: '재생하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 일시정지
  Future<void> pause() async {
    try {
      await repository.pause();
    } catch (e) {
      state = state.copyWith(
        errorMessage: '일시정지하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 정지
  Future<void> stop() async {
    try {
      await repository.stop();
    } catch (e) {
      state = state.copyWith(
        errorMessage: '정지하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 탐색
  Future<void> seekTo(Duration position) async {
    try {
      await repository.seekTo(position);
    } catch (e) {
      state = state.copyWith(
        errorMessage: '탐색하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 재생 속도 설정
  Future<void> setSpeed(double speed) async {
    try {
      await repository.setSpeed(speed);
      state = state.copyWith(speed: speed);
    } catch (e) {
      state = state.copyWith(
        errorMessage: '재생 속도를 설정하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 볼륨 설정
  Future<void> setVolume(double volume) async {
    try {
      await repository.setVolume(volume);
      state = state.copyWith(volume: volume);
    } catch (e) {
      state = state.copyWith(
        errorMessage: '볼륨을 설정하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 반복 모드 설정
  Future<void> setLoopMode(entity.LoopMode loopMode) async {
    try {
      await repository.setLoopMode(loopMode);
      state = state.copyWith(loopMode: loopMode);
    } catch (e) {
      state = state.copyWith(
        errorMessage: '반복 모드를 설정하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 음소거 토글
  Future<void> toggleMute() async {
    final isMuted = !state.isMuted;
    try {
      await repository.setMuted(isMuted);
      state = state.copyWith(isMuted: isMuted);
    } catch (e) {
      state = state.copyWith(
        errorMessage: '음소거를 설정하는 중 오류가 발생했습니다: $e',
      );
    }
  }

  /// 정리
  @override
  Future<void> dispose() async {
    await repository.dispose();
    super.dispose();
  }
}

/// 오디오 플레이어 컨트롤러 프로바이더
final audioPlayerControllerProvider =
    StateNotifierProvider<AudioPlayerController, entity.PlayerState>((ref) {
  final repository = ref.watch(audioPlayerRepositoryProvider);
  final loadAndPlayTrackUseCase = ref.watch(loadAndPlayTrackUseCaseProvider);
  final getAudioTracksUseCase = ref.watch(getAudioTracksUseCaseProvider);

  return AudioPlayerController(
    repository: repository,
    loadAndPlayTrackUseCase: loadAndPlayTrackUseCase,
    getAudioTracksUseCase: getAudioTracksUseCase,
  );
});

/// 오디오 플레이어 레포지토리 프로바이더
final audioPlayerRepositoryProvider = Provider<AudioPlayerRepository>((ref) {
  // TODO: 실제 구현체 제공
  throw UnimplementedError('오디오 플레이어 레포지토리 구현 필요');
});

/// LoadAndPlayTrackUseCase 프로바이더
final loadAndPlayTrackUseCaseProvider = Provider<LoadAndPlayTrackUseCase>((ref) {
  final repository = ref.watch(audioPlayerRepositoryProvider);
  return LoadAndPlayTrackUseCase(repository);
});

/// GetAudioTracksUseCase 프로바이더
final getAudioTracksUseCaseProvider = Provider<GetAudioTracksUseCase>((ref) {
  final repository = ref.watch(audioPlayerRepositoryProvider);
  return GetAudioTracksUseCase(repository);
}); 