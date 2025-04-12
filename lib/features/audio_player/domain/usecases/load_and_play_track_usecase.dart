import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import '../entities/audio_track.dart';
import '../repositories/audio_player_repository.dart';

/// 오디오 트랙 로드 및 재생 유스케이스
class LoadAndPlayTrackUseCase implements UseCase<void, LoadTrackParams> {
  final AudioPlayerRepository repository;

  LoadAndPlayTrackUseCase(this.repository);

  @override
  Future<void> call(LoadTrackParams params) async {
    await repository.loadTrack(params.track);
    await repository.play();
  }
}

/// 오디오 트랙 로드를 위한 매개변수 클래스
class LoadTrackParams {
  final AudioTrack track;

  const LoadTrackParams({required this.track});
} 