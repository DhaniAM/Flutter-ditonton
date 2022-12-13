import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class GetTvSeriesWatchListStatus {
  final TvSeriesRepository repository;

  GetTvSeriesWatchListStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isTvSeriesAddedToWatchlist(id);
  }
}
