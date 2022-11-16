import 'package:ditonton/data/models/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series_model.dart';
import 'package:http/http.dart' as http;

abstract class TvSeriesRemoteDataSource {
  Future<List<TvSeriesModel>> getNowPlayingTvSeries();
  Future<List<TvSeriesModel>> getPopularTvSeries();
  Future<List<TvSeriesModel>> getTopRatedTvSeries();
  Future<TvSeriesDetailResponse> getTvSeriesDetail(int id);
  Future<List<TvSeriesModel>> getTvSeriesRecommendations(int id);
  Future<List<TvSeriesModel>> searchTvSeries(String query);
}

class TvSeriesRemoteDataSourceImpl extends TvSeriesRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvSeriesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvSeriesModel>> getNowPlayingTvSeries() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if(response.statusCode == 200) {
      return TvDeta
    }
  }

  @override
  Future<TvSeriesDetailResponse> getTvSeriesDetail(int id) {
    // TODO: implement getMovieDetail
    throw UnimplementedError();
  }

  @override
  Future<List<TvSeriesModel>> getTvSeriesRecommendations(int id) {
    // TODO: implement getMovieRecommendations
    throw UnimplementedError();
  }

  @override
  Future<List<TvSeriesModel>> getPopularTvSeries() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<TvSeriesModel>> getTopRatedTvSeries() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<TvSeriesModel>> searchTvSeries(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
