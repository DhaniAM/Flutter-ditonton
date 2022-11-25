import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_series_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource =
        TvSeriesLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertTvSeriesWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => 2);
      // act
      final result = await dataSource.insertWatchList(testTvSeriesTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertTvSeriesWatchlist(testTvSeriesTable))
          .thenThrow(Exception());
      // act
      final result = dataSource.insertWatchList(testTvSeriesTable);
      // assert
      expect(result, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeTvSeriesWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchList(testTvSeriesTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeTvSeriesWatchlist(testTvSeriesTable))
          .thenThrow(Exception());
      // act
      final result = dataSource.removeWatchList(testTvSeriesTable);
      // assert
      expect(result, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get movie detail by Id', () {
    final int testId = 212;

    test('should return Movie Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getContentById(testId))
          .thenAnswer((_) async => testTvSeriesMap);
      // act
      final result = await dataSource.getTvSeriesId(testId);
      // assert
      expect(result, testTvSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getContentById(testId))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvSeriesId(testId);
      // assert
      expect(result, null);
    });
  });

  group('Get tv series watchlist', () {
    test('should return list of TvSeriesTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getTvSeriesWatchlist())
          .thenAnswer((_) async => [testTvSeriesMap]);
      // act
      final result = await dataSource.getTvSeriesWatchlist();
      // assert
      expect(result, [testTvSeriesTable]);
    });
  });
}
