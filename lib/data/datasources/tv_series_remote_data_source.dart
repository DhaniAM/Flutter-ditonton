import 'package:ditonton/data/models/tv_series_model.dart';

abstract class TvSeriesRemoteDataSource {
  Future<List<TvSeriesModel>> getNowPlayingTv();
}
