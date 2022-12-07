import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();

  late MockDatabaseHelper mockDatabaseHelper;
  late DatabaseHelper databaseHelper;
  late Database mockDatabase;

  const String _tblWatchlist = 'watchlist';

  setUpAll(() async {
    mockDatabaseHelper = MockDatabaseHelper();
    databaseHelper = DatabaseHelper();
    mockDatabase = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    mockDatabase.execute('''
      CREATE TABLE  $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT,
        type TEXT
      );
    ''');
    databaseHelper.setTestDatabase = mockDatabase;
  });

  group('Movie database', () {
    test('should return success when inserting movie to db', () async {
      // act
      final result = await databaseHelper.insertMovieWatchlist(testMovieTable);

      // assert
      expect(result, greaterThanOrEqualTo(1));
    });

    test('should return success when removing from db', () async {
      // arrange
      when(mockDatabaseHelper.removeMovieWatchlist(testMovieTable))
          .thenAnswer((_) async => 1);
      // await mockDatabaseHelper.insertMovieWatchlist(testMovieTable);
      // await databaseHelper.insertMovieWatchlist(testMovieTable);
      // act
      final mockResult =
          await mockDatabaseHelper.removeMovieWatchlist(testMovieTable);
      final result = await databaseHelper.removeMovieWatchlist(testMovieTable);
      // assert
      expect(result, mockResult);
    });

    test('should return movie json from db', () async {
      // arrange
      await databaseHelper.insertMovieWatchlist(testMovieTable);
      // act
      final result = await databaseHelper.getContentById(1);
      // assert
      expect(result, testMovieTable.toJson());
    });

    test('should return list of movies from db', () async {
      // act
      final result = await databaseHelper.getMovieWatchlist();
      // assert
      expect(result, [testMovieTable.toJson()]);
    });
  });

  group('Tv series database', () {
    test('should return success when inserted to db', () async {
      // act
      final result =
          await databaseHelper.insertTvSeriesWatchlist(testTvSeriesTable);

      // assert
      expect(result, greaterThanOrEqualTo(1));
    });

    test('should return success when removing from db', () async {
      // arrange
      when(mockDatabaseHelper.removeTvSeriesWatchlist(testTvSeriesTable))
          .thenAnswer((_) async => 1);
      // act
      final mockResult =
          await mockDatabaseHelper.removeTvSeriesWatchlist(testTvSeriesTable);
      final result =
          await databaseHelper.removeTvSeriesWatchlist(testTvSeriesTable);
      // assert
      expect(result, mockResult);
    });

    test('should return tv series json from db', () async {
      // arrange
      await databaseHelper.insertTvSeriesWatchlist(testTvSeriesTable);
      // act
      final result = await databaseHelper.getContentById(testTvSeriesTable.id);
      // assert
      expect(result, testTvSeriesTable.toJson());
    });

    test('should return list of tv series from db', () async {
      // act
      final result = await databaseHelper.getTvSeriesWatchlist();
      // assert
      expect(result, [testTvSeriesTable.toJson()]);
    });
  });
}
