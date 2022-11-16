import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetailResponse extends Equatable {
  TvSeriesDetailResponse({
    required this.backdropPath,
    required this.firstAirDate,
    required this.lastAirDate,
    required this.genres,
    required this.id,
    required this.title,
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
  final List<GenreModel> genres;
  final int id;
  final String title;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String overview;
  final String? posterPath;
  final List<Seasons> seasons;
  final String tagline;
  final double voteAverage;
  final int voteCount;

  factory TvSeriesDetailResponse.fromJson(Map<String, dynamic> json) =>
      TvSeriesDetailResponse(
        posterPath: json['poster_path'],
        popularity: json['popularity'],
        id: json['id'],
        backdropPath: json['backdrop_path'],
        voteAverage: json['vote_average'],
        overview: json['overview'],
        firstAirDate: json['first_air_date'],
        originCountry: json['origin_country'],
        genreIds: json['genre_ids'],
        originalLanguage: json['original_language'],
        voteCount: json['vote_count'],
        title: json['name'],
        originalName: json['original_name'],
      );

  Map<String, dynamic> toJson() => {
        'poster_path': posterPath,
        'popularity': popularity,
        'id': id,
        'backdrop_path': backdropPath,
        'vote_average': voteAverage,
        'overview': overview,
        'first_air_date': firstAirDate,
        'origin_country': originCountry,
        'genre_ids': genreIds,
        'original_language': originalLanguage,
        'vote_count': voteCount,
        'title': title,
        'originalName': originalName,
      };

  TvSeriesDetail toEntity() {
    return TvSeriesDetail(
      posterPath: posterPath,
      popularity: popularity,
      id: id,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      overview: overview,
      firstAirDate: firstAirDate,
      originCountry: originCountry,
      genreIds: genreIds,
      originalLanguage: originalLanguage,
      voteCount: voteCount,
      title: title,
      originalName: originalName,
    );
  }

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
