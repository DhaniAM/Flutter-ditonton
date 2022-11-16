import 'package:equatable/equatable.dart';

class TvSeries extends Equatable {
  TvSeries({
    required this.posterPath,
    required this.popularity,
    required this.id,
    required this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.firstAirDate,
    required this.originCountry,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.title,
    required this.originalName,
  });

  TvSeries.watchlist({
    required this.id,
    required this.posterPath,
    required this.overview,
    required this.title,
  });

  String? posterPath;
  double? popularity;
  int id;
  String? backdropPath;
  int? voteAverage;
  String overview;
  String? firstAirDate;
  List<String>? originCountry;
  List<int>? genreIds;
  String? originalLanguage;
  int? voteCount;
  String title;
  String? originalName;

  @override
  List<Object?> get props => [
        posterPath,
        popularity,
        id,
        backdropPath,
        voteAverage,
        overview,
        firstAirDate,
        originCountry,
        genreIds,
        originalLanguage,
        voteCount,
        title,
        originalName
      ];
}
