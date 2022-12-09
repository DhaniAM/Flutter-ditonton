import 'package:ditonton/domain/usecases/get_now_playing_tv_series.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_list_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesListBloc extends Bloc<TvSeriesListEvent, TvSeriesListState> {
  final GetNowPlayingTvSeries getNowPlayingTvSeries;
  final GetPopularTvSeries getPopularTvSeries;
  final GetTopRatedTvSeries getTopRatedTvSeries;

  TvSeriesListBloc({
    required this.getTopRatedTvSeries,
    required this.getPopularTvSeries,
    required this.getNowPlayingTvSeries,
  }) : super(TvSeriesListEmpty()) {
    on<OnFetchTvSeries>((event, emit) async {
      emit(TvSeriesListLoading());
      final nowPlaying = await getNowPlayingTvSeries.execute();
      final popular = await getPopularTvSeries.execute();
      final topRated = await getTopRatedTvSeries.execute();

      nowPlaying.fold((failure) {
        emit(TvSeriesListError(failure.message));
      }, (nowPlayingTvSeries) {
        popular.fold((failure) {
          emit(TvSeriesListError(failure.message));
        }, (popularTvSeries) {
          topRated.fold((failure) {
            emit(TvSeriesListError(failure.message));
          }, (topRatedTvSeries) {
            emit(TvSeriesListHasData(
                nowPlayingTvSeries, topRatedTvSeries, popularTvSeries));
          });
        });
      });
    });
  }
}
