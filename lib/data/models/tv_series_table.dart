import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

/// Data to save on Database
class TvSeriesTable extends Equatable {
  TvSeriesTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.type,
  });

  final int id;
  final String title;
  final String? posterPath;
  final String overview;
  final String type;

  factory TvSeriesTable.fromEntity(TvSeriesDetail tvSeries) => TvSeriesTable(
        id: tvSeries.id,
        title: tvSeries.title,
        posterPath: tvSeries.posterPath,
        overview: tvSeries.overview,
        type: 'tvSeries',
      );

  /// from Database
  factory TvSeriesTable.fromJson(Map<String, dynamic> map) => TvSeriesTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
        type: 'tvSeries',
      );

  /// used by [DatabaseHelper]
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'type': 'tvSeries',
      };

  TvSeries toEntity() => TvSeries.watchlist(
      id: id,
      posterPath: posterPath,
      overview: overview,
      title: title,
      type: 'tvSeries');

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        overview,
        type,
      ];
}
