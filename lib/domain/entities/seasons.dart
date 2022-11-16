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

  String airDate;
  int episodeCount;
  int id;
  String title;
  String overview;
  String posterPath;
  int seasonNumber;

  @override
  List<Object?> get props =>
      [airDate, episodeCount, id, title, overview, posterPath, seasonNumber];
}
