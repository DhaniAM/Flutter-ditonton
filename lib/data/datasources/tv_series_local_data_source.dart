import '../models/tv_series_table.dart';

abstract class TvSeriesLocalDataSource {
  Future<String> insertWatchList(TvSeriesTable tvSeries);
  Future<String> removeWatchList(TvSeriesTable tvSeries);
  Future<TvSeriesTable?> getTvSeriesId(int id);
  Future<List<TvSeriesTable>> getWatchListTvSeries();
}

class TvSeriesLocalDataSourceImpl implements TvSeriesLocalDataSource {
  @override
  Future<TvSeriesTable?> getTvSeriesId(int id) {
    // TODO: implement getTvSeriesId
    throw UnimplementedError();
  }

  @override
  Future<List<TvSeriesTable>> getWatchListTvSeries() {
    // TODO: implement getWatchListTvSeries
    throw UnimplementedError();
  }

  @override
  Future<String> insertWatchList(TvSeriesTable tvSeries) {
    // TODO: implement insertWatchList
    throw UnimplementedError();
  }

  @override
  Future<String> removeWatchList(TvSeriesTable tvSeries) {
    // TODO: implement removeWatchList
    throw UnimplementedError();
  }
}
