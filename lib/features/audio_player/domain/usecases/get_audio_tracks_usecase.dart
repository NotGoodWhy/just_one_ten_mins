import 'package:just_one_ten_mins/core/usecase/usecase.dart';
import '../entities/audio_track.dart';
import '../repositories/audio_player_repository.dart';

/// 오디오 트랙 목록 조회 유스케이스
class GetAudioTracksUseCase implements UseCase<List<AudioTrack>, NoParams> {
  final AudioPlayerRepository repository;

  GetAudioTracksUseCase(this.repository);

  @override
  Future<List<AudioTrack>> call(NoParams params) {
    return repository.getAudioTracks();
  }
} 