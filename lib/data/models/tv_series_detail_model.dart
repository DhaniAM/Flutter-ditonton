import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/seasons_model.dart';
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
    required this.type,
  });

  final String? backdropPath;
  final String? firstAirDate;
  final String lastAirDate;
  final List<GenreModel> genres;
  final int id;
  final String title;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String overview;
  final String? posterPath;
  final List<SeasonsModel> seasons;
  final String tagline;
  final double voteAverage;
  final int voteCount;
  final String type;

  /// Change to [TvSeriesDetailResponse]/model from JSON
  factory TvSeriesDetailResponse.fromJson(Map<String, dynamic> json) =>
      TvSeriesDetailResponse(
        backdropPath: json['backdrop_path'],
        firstAirDate: json['first_air_date'],
        lastAirDate: json['last_air_date'],
        genres: List<GenreModel>.from(
            json['genres'].map((x) => GenreModel.fromJson(x))),
        id: json['id'],
        title: json['name'],
        numberOfEpisodes: json['number_of_episodes'],
        numberOfSeasons: json['number_of_seasons'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        seasons: List<SeasonsModel>.from(
            json['seasons'].map((x) => SeasonsModel.fromJson(x))),
        tagline: json['tagline'],
        voteAverage: double.parse(json['vote_average'].toStringAsFixed(2)),
        voteCount: json['vote_count'],
        type: 'tvSeries',
      );

  /// Change to [TvSeriesDetail] from [TvSeriesDetailResponse]/model
  TvSeriesDetail toEntity() {
    return TvSeriesDetail(
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
      lastAirDate: lastAirDate,
      genres: genres.map((x) => x.toEntity()).toList(),
      id: id,
      title: title,
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      overview: overview,
      posterPath: posterPath,
      seasons: seasons.map((x) => x.toEntity()).toList(),
      tagline: tagline,
      voteAverage: voteAverage,
      voteCount: voteCount,
      type: 'tvSeries',
    );
  }

  @override
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        lastAirDate,
        genres,
        id,
        title,
        numberOfEpisodes,
        numberOfSeasons,
        overview,
        posterPath,
        seasons,
        tagline,
        voteAverage,
        voteCount,
        type,
      ];
}
