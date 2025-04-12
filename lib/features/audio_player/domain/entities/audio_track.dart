import 'package:equatable/equatable.dart';

/// 오디오 트랙 엔티티
class AudioTrack extends Equatable {
  final String id;
  final String title;
  final String? artist;
  final String? filePath;
  final String? url;
  final String? artworkUrl;
  final Duration? duration;
  final bool isFavorite;
  final DateTime addedAt;
  final DateTime? lastPlayedAt;
  final Duration? lastPosition;
  
  const AudioTrack({
    required this.id,
    required this.title,
    this.artist,
    this.filePath,
    this.url,
    this.artworkUrl,
    this.duration,
    this.isFavorite = false,
    required this.addedAt,
    this.lastPlayedAt,
    this.lastPosition,
  });
  
  /// 마지막 재생 위치 업데이트
  AudioTrack copyWithPosition(Duration position) {
    return AudioTrack(
      id: id,
      title: title,
      artist: artist,
      filePath: filePath,
      url: url,
      artworkUrl: artworkUrl,
      duration: duration,
      isFavorite: isFavorite,
      addedAt: addedAt,
      lastPlayedAt: DateTime.now(),
      lastPosition: position,
    );
  }
  
  /// 즐겨찾기 상태 업데이트
  AudioTrack copyWithFavorite(bool favorite) {
    return AudioTrack(
      id: id,
      title: title,
      artist: artist,
      filePath: filePath,
      url: url,
      artworkUrl: artworkUrl,
      duration: duration,
      isFavorite: favorite,
      addedAt: addedAt,
      lastPlayedAt: lastPlayedAt,
      lastPosition: lastPosition,
    );
  }
  
  @override
  List<Object?> get props => [
    id, 
    title, 
    artist, 
    filePath, 
    url, 
    artworkUrl, 
    duration, 
    isFavorite, 
    addedAt, 
    lastPlayedAt, 
    lastPosition
  ];
} 