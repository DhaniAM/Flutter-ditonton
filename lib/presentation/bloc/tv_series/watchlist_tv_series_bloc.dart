import 'package:ditonton/domain/usecases/get_watchlist_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/watchlist_tv_series_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/watchlist_tv_series_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistTvSeriesBloc
    extends Bloc<WatchlistTvSeriesEvent, WatchlistTvSeriesState> {
  final GetWatchlistTvSeries getWatchlistTvSeries;

  WatchlistTvSeriesBloc(this.getWatchlistTvSeries)
      : super(WatchlistTvSeriesEmpty()) {
    on<OnFetchWatchlistTvSeries>((event, emit) async {
      emit(WatchlistTvSeriesLoading());
      final result = await getWatchlistTvSeries.execute();
      result.fold((failure) {
        emit(WatchlistTvSeriesError(failure.message));
      }, (tvSeries) {
        emit(WatchlistTvSeriesHasData(tvSeries));
      });
    });
  }
}
