import 'package:ditonton/domain/usecases/get_now_playing_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingTvSeriesBloc
    extends Bloc<NowPlayingTvSeriesEvent, NowPlayingTvSeriesState> {
  final GetNowPlayingTvSeries getNowPlayingTvSeries;

  NowPlayingTvSeriesBloc(this.getNowPlayingTvSeries)
      : super(NowPlayingTvSeriesEmpty()) {
    on<OnFetchNowPlayingTvSeries>((event, emit) async {
      emit(NowPlayingTvSeriesLoading());
      final result = await getNowPlayingTvSeries.execute();
      result.fold((failure) {
        emit(NowPlayingTvSeriesError(failure.message));
      }, (tv) {
        emit(NowPlayingTvSeriesHasData(tv));
      });
    });
  }
}
