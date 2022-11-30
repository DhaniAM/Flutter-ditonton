import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockDatabaseHelper mockDatabaseHelper;
  const tId = 25;

  List<Map<String, dynamic>> tListMovies = [testMovieMap];
  List<Map<String, dynamic>> tListTvSeries = [testTvSeriesMap];

  setUp(() async {
    mockDatabaseHelper = MockDatabaseHelper();
  });

  group('Movie database', () {
    test('should return success when inserting movie to db', () async {
      // arrange
      when(mockDatabaseHelper.insertMovieWatchlist(testMovieTable))
          .thenAnswer((_) async => tId);
      // act
      final result =
          await mockDatabaseHelper.insertMovieWatchlist(testMovieTable);
      // assert
      expect(result, tId);
    });

    test('should return success when removing from db', () async {
      // arrange
      when(mockDatabaseHelper.removeMovieWatchlist(testMovieTable))
          .thenAnswer((_) async => tId);

      // act
      final result =
          await mockDatabaseHelper.removeMovieWatchlist(testMovieTable);
      // assert
      expect(result, tId);
    });

    test('should return movie json from db', () async {
      // arrange
      when(mockDatabaseHelper.getContentById(tId))
          .thenAnswer((_) async => testMovieMap);
      // act
      final result = await mockDatabaseHelper.getContentById(tId);
      print(result);
      // assert
      expect(result, testMovieMap);
    });

    test('should return list of movies from db', () async {
      // arrange
      when(mockDatabaseHelper.getMovieWatchlist())
          .thenAnswer((_) async => tListMovies);
      // act
      final result = await mockDatabaseHelper.getMovieWatchlist();
      // assert
      expect(result, tListMovies);
    });
  });

  group('Tv series database', () {
    test('should return success when inserted to db', () async {
      // arrange
      when(mockDatabaseHelper.insertTvSeriesWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => tId);
      // act
      final result =
          await mockDatabaseHelper.insertTvSeriesWatchlist(testTvSeriesTable);
      // assert
      expect(result, tId);
    });

    test('should return success when removing from db', () async {
      // arrange
      when(mockDatabaseHelper.removeTvSeriesWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => tId);
      // act
      final result =
          await mockDatabaseHelper.removeTvSeriesWatchlist(testTvSeriesTable);
      // assert
      expect(result, tId);
    });

    test('should return tv series json from db', () async {
      // arrange
      when(mockDatabaseHelper.getContentById(tId))
          .thenAnswer((_) async => testTvSeriesMap);
      // act
      final result = await mockDatabaseHelper.getContentById(tId);
      // assert
      expect(result, testTvSeriesMap);
    });

    test('should return list of tv series from db', () async {
      // arrange
      when(mockDatabaseHelper.getTvSeriesWatchlist())
          .thenAnswer((_) async => tListTvSeries);
      // act
      final result = await mockDatabaseHelper.getTvSeriesWatchlist();
      // assert
      expect(result, tListTvSeries);
    });
  });
}
