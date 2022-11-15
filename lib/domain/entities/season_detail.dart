import 'package:ditonton/domain/entities/episode.dart';
import 'package:equatable/equatable.dart';

class SeasonDetail extends Equatable {
  SeasonDetail({
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.id,
    required this.posterPath,
    required this.seasonNumber,
  });

  String airDate;
  List<Episode> episodes;
  String name;
  String overview;
  int id;
  String? posterPath;
  int seasonNumber;

  @override
  List<Object?> get props => [
        airDate,
        episodes,
        name,
        overview,
        id,
        posterPath,
        seasonNumber,
      ];
}
