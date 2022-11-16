import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/seasons.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetail extends Equatable {
  TvSeriesDetail({
    required this.backdropPath,
    required this.firstAirDate,
    required this.lastAirDate,
    required this.genres,
    required this.id,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.overview,
    required this.posterPath,
    required this.seasons,
    required this.tagline,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final String firstAirDate;
  final String lastAirDate;
  final List<Genre> genres;
  final int id;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String overview;
  final String? posterPath;
  final List<Seasons> seasons;
  final String tagline;
  final double voteAverage;
  final int voteCount;

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        lastAirDate,
        genres,
        id,
        name,
        numberOfSeasons,
        numberOfEpisodes,
        overview,
        posterPath,
        seasons,
        tagline,
        voteAverage,
        voteCount
      ];
}
