import 'package:equatable/equatable.dart';

class Seasons extends Equatable {
  Seasons({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  final String? airDate;
  final int? episodeCount;
  final int id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;

  @override
  List<Object?> get props =>
      [airDate, episodeCount, id, title, overview, posterPath, seasonNumber];
}
