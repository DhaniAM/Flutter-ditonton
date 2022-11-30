import 'package:ditonton/data/models/tv_series_model.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  final tTvSeriesModel = TvSeriesModel(
    posterPath: 'posterPath',
    popularity: 6.5454,
    id: 23,
    backdropPath: 'backdropPath',
    voteAverage: 3.455,
    overview: 'overview',
    firstAirDate: 'firstAirDate',
    originCountry: ['Indonesia'],
    genreIds: [21, 22],
    originalLanguage: 'originalLanguage',
    voteCount: 57,
    title: 'title',
    originalName: 'originalName',
    type: 'tvSeries',
  );

  final tTvSeries = TvSeries(
    posterPath: 'posterPath',
    popularity: 6.5454,
    id: 23,
    backdropPath: 'backdropPath',
    voteAverage: 3.455,
    overview: 'overview',
    firstAirDate: 'firstAirDate',
    originCountry: ['Indonesia'],
    genreIds: [21, 22],
    originalLanguage: 'originalLanguage',
    voteCount: 57,
    title: 'title',
    originalName: 'originalName',
    type: 'tvSeries',
  );

  test('should be a subclass of Tv Series entity', () async {
    final result = tTvSeriesModel.toEntity();
    expect(result, tTvSeries);
  });

  test('should return JSON format from TvSeriesTable', () {
    final result = testTvSeriesTable.toJson();
    expect(result, testTvSeriesMap);
  });
}
