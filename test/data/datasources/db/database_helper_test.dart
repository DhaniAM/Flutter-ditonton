import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockDatabaseHelper databaseHelper;
  // late Database? database;
  const String tblWatchlist = 'watchlist';

  const tId = 25;
  List<Map<String, dynamic>> tListMovies = [testMovieMap];
  List<Map<String, dynamic>> tListTvSeries = [testTvSeriesMap];

  setUp(() async {
    databaseHelper = MockDatabaseHelper();
    // database = await databaseHelper.database;
  });

  group('Movie database', () {
    test('should return success when inserting movie to db', () async {
      // arrange
      when(databaseHelper.insertMovieWatchlist(testMovieTable))
          .thenAnswer((_) async => tId);
      // act
      final result = await databaseHelper.insertMovieWatchlist(testMovieTable);
      // assert
      expect(result, tId);
    });

    test('should return success when removing from db', () async {
      // arrange
      when(databaseHelper.removeMovieWatchlist(testMovieTable))
          .thenAnswer((_) async => tId);

      // act
      final result = await databaseHelper.removeMovieWatchlist(testMovieTable);
      // assert
      expect(result, tId);
    });

    test('should return movie json from db', () async {
      // arrange
      when(databaseHelper.getContentById(tId))
          .thenAnswer((_) async => testMovieMap);
      // act
      final result = await databaseHelper.getContentById(tId);
      print(result);
      // assert
      expect(result, testMovieMap);
    });

    test('should return list of movies from db', () async {
      // arrange
      when(databaseHelper.getMovieWatchlist())
          .thenAnswer((_) async => tListMovies);
      // act
      final result = await databaseHelper.getMovieWatchlist();
      // assert
      expect(result, tListMovies);
    });
  });

  group('Tv series database', () {
    test('should return success when inserted to db', () async {
      // arrange
      when(databaseHelper.insertTvSeriesWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => tId);
      // act
      final result =
          await databaseHelper.insertTvSeriesWatchlist(testTvSeriesTable);
      // assert
      expect(result, tId);
    });

    test('should return success when removing from db', () async {
      // arrange
      when(databaseHelper.removeTvSeriesWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => tId);
      // act
      final result =
          await databaseHelper.removeTvSeriesWatchlist(testTvSeriesTable);
      // assert
      expect(result, tId);
    });

    test('should return tv series json from db', () async {
      // arrange
      when(databaseHelper.getContentById(tId))
          .thenAnswer((_) async => testTvSeriesMap);
      // act
      final result = await databaseHelper.getContentById(tId);
      // assert
      expect(result, testTvSeriesMap);
    });

    test('should return list of tv series from db', () async {
      // arrange
      when(databaseHelper.getTvSeriesWatchlist())
          .thenAnswer((_) async => tListTvSeries);
      // act
      final result = await databaseHelper.getTvSeriesWatchlist();
      // assert
      expect(result, tListTvSeries);
    });
  });
}
