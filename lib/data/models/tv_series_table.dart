import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/tv_series.dart';

class TvSeriesTable extends Equatable {
  TvSeriesTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  final int id;
  final String title;
  final String? posterPath;
  final String overview;

  factory TvSeriesTable.fromEntity(TvSeriesDetail tvSeries) => TvSeriesTable(
        id: tvSeries.id,
        title: tvSeries.title,
        posterPath: tvSeries.posterPath,
        overview: tvSeries.overview,
      );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
      };

  TvSeries toEntity() => TvSeries.watchlist(
        id: id,
        posterPath: posterPath,
        overview: overview,
        title: title,
      );

  List<Object?> get props => [
        id,
        title,
        posterPath,
        overview,
      ];
}
