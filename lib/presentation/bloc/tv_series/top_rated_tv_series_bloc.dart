import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/top_rated_tv_series_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/top_rated_tv_series_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedTvSeriesBloc
    extends Bloc<TopRatedTvSeriesEvent, TopRatedTvSeriesState> {
  final GetTopRatedTvSeries getTopRatedTvSeries;

  TopRatedTvSeriesBloc(this.getTopRatedTvSeries)
      : super(TopRatedTvSeriesEmpty()) {
    on<OnFetchTopRatedTvSeries>((event, emit) async {
      emit(TopRatedTvSeriesLoading());
      final result = await getTopRatedTvSeries.execute();
      result.fold((failure) {
        emit(TopRatedTvSeriesError(failure.message));
      }, (tv) {
        emit(TopRatedTvSeriesHasData(tv));
      });
    });
  }
}
