import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

abstract class TvSeriesDetailState extends Equatable {
  const TvSeriesDetailState();

  @override
  List<Object> get props => [];
}

/// Movie Detail
class TvSeriesDetailEmpty extends TvSeriesDetailState {}

class TvSeriesDetailLoading extends TvSeriesDetailState {}

class TvSeriesDetailError extends TvSeriesDetailState {
  final String message;
  TvSeriesDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class TvSeriesDetailHasData extends TvSeriesDetailState {
  final TvSeriesDetail tvSeriesDetail;
  final List<TvSeries> tvSeriesRecommendation;

  TvSeriesDetailHasData({
    required this.tvSeriesDetail,
    required this.tvSeriesRecommendation,
  });

  @override
  List<Object> get props => [
        tvSeriesDetail,
        tvSeriesRecommendation,
      ];
}
