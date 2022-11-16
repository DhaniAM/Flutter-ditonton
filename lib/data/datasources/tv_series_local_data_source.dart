abstract class TvSeriesLocalDataSource {
  Future<String> insertWatchList(TvSeriesTable tvSeries);
  Future<String> removeWatchList(TvSeriesTable tvSeries);
  Future<TvSeriesTable?> getTvSeriesId(int id);
  Future<List<TvSeriesTable>> getWatchListTvSeries();
}
