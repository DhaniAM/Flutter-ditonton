import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:equatable/equatable.dart';

class TvSeriesModel extends Equatable {
  TvSeriesModel({
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

  final String? posterPath;
  final double popularity;
  final int id;
  final String? backdropPath;
  final double voteAverage;
  final String overview;
  final String? firstAirDate;
  final List<dynamic> originCountry;
  final List<dynamic> genreIds;
  final String originalLanguage;
  final int voteCount;
  final String title;
  final String originalName;
  final String type;

  /// Change to [TvSeriesModel] from JSON
  factory TvSeriesModel.fromJson(Map<String, dynamic> json) => TvSeriesModel(
        posterPath: json['poster_path'],
        popularity: json['popularity'],
        id: json['id'],
        backdropPath: json['backdrop_path'],
        voteAverage: double.parse(json['vote_average'].toStringAsFixed(2)),
        overview: json['overview'],
        firstAirDate: json['first_air_date'],
        originCountry: json['origin_country'],
        genreIds: json['genre_ids'],
        originalLanguage: json['original_language'],
        voteCount: json['vote_count'],
        title: json['name'],
        originalName: json['original_name'],
        type: 'tvSeries',
      );

  /// Change to JSON from [TvSeriesModel]
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
        'original_name': originalName,
        'type': 'tvSeries'
      };

  /// Change to [TvSeries] from [TvSeriesModel]
  TvSeries toEntity() {
    return TvSeries(
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
      type: this.type,
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
        originalName,
        type,
      ];
}
