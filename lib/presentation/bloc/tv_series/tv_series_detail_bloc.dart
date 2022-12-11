import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_detail_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesDetailBloc
    extends Bloc<TvSeriesDetailEvent, TvSeriesDetailState> {
  final GetTvSeriesDetail getTvSeriesDetail;
  final GetTvSeriesRecommendations getTvSeriesRecommendations;

  TvSeriesDetailBloc({
    required this.getTvSeriesDetail,
    required this.getTvSeriesRecommendations,
  }) : super(TvSeriesDetailEmpty()) {
    on<OnFetchTvSeriesDetail>((event, emit) async {
      emit(TvSeriesDetailLoading());
      final tvSeriesId = event.tvSeriesId;
      final detailResult = await getTvSeriesDetail.execute(tvSeriesId);
      final recommendationResult =
          await getTvSeriesRecommendations.execute(tvSeriesId);

      detailResult.fold(
        (failure) {
          emit(TvSeriesDetailError(failure.message));
        },
        (tvSeries) {
          recommendationResult.fold(
            (failure) {
              emit(TvSeriesDetailError(failure.message));
            },
            (listTvSeries) {
              emit(TvSeriesDetailHasData(
                tvSeriesDetail: tvSeries,
                tvSeriesRecommendation: listTvSeries,
              ));
            },
          );
        },
      );
    });
  }
}
