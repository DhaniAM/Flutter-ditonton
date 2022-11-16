import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';

import '../models/tv_series_table.dart';

abstract class TvSeriesLocalDataSource {
  Future<String> insertWatchList(TvSeriesTable tvSeries);
  Future<String> removeWatchList(TvSeriesTable tvSeries);
  Future<TvSeriesTable?> getTvSeriesId(int id);
  Future<List<TvSeriesTable>> getWatchListTvSeries();
}

class TvSeriesLocalDataSourceImpl implements TvSeriesLocalDataSource {
  final DatabaseHelper databaseHelper;

  TvSeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchList(TvSeriesTable tvSeries) async {
    try {
      await databaseHelper.insertTvSeriesWatchlist(tvSeries);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchList(TvSeriesTable tvSeries) async {
    try {
      await databaseHelper.removeTvSeriesWatchlist(tvSeries);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TvSeriesTable?> getTvSeriesId(int id) async {
    final result = await databaseHelper.getContentById(id);
    if (result != null) {
      return TvSeriesTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvSeriesTable>> getWatchListTvSeries() async {
    final result = await databaseHelper.getWatchlist();
    return result.map((data) => TvSeriesTable.fromMap(data)).toList();
  }
}
