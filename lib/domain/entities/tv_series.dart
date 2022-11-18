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
    required this.type,
  });

  /// To database model, not to JSON
  TvSeries.watchlist({
    required this.id,
    required this.posterPath,
    required this.overview,
    required this.title,
    required this.type,
    this.popularity,
    this.voteAverage,
    this.voteCount,
    this.genreIds,
    this.backdropPath,
    this.firstAirDate,
    this.originalName,
    this.originalLanguage,
    this.originCountry,
  });

  final String? posterPath;
  final double? popularity;
  final int id;
  final String? backdropPath;
  final double? voteAverage;
  final String overview;
  final String? firstAirDate;
  final List<dynamic>? originCountry;
  final List<dynamic>? genreIds;
  final String? originalLanguage;
  final int? voteCount;
  final String title;
  final String? originalName;
  final String type;

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
        originalName,
        type,
      ];
}
