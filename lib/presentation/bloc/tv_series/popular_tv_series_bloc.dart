import 'package:ditonton/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/popular_tv_series_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/popular_tv_series_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTvSeriesBloc
    extends Bloc<PopularTvSeriesEvent, PopularTvSeriesState> {
  final GetPopularTvSeries getPopularTvSeries;

  PopularTvSeriesBloc(this.getPopularTvSeries) : super(PopularTvSeriesEmpty()) {
    on<OnFetchPopularTvSeries>((event, emit) async {
      emit(PopularTvSeriesLoading());
      final result = await getPopularTvSeries.execute();
      result.fold((failure) {
        emit(PopularTvSeriesError(failure.message));
      }, (tv) {
        emit(PopularTvSeriesHasData(tv));
      });
    });
  }
}
