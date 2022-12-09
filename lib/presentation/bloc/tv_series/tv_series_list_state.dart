import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:equatable/equatable.dart';

abstract class TvSeriesListState extends Equatable {
  const TvSeriesListState();

  @override
  List<Object> get props => [];
}

class TvSeriesListEmpty extends TvSeriesListState {}

class TvSeriesListError extends TvSeriesListState {
  final String message;
  TvSeriesListError(this.message);

  @override
  List<Object> get props => [message];
}

class TvSeriesListLoading extends TvSeriesListState {}

class TvSeriesListHasData extends TvSeriesListState {
  final List<TvSeries> nowPlayingTvSeries;
  final List<TvSeries> popularTvSeries;
  final List<TvSeries> topRatedTvSeries;

  TvSeriesListHasData(
      this.nowPlayingTvSeries, this.topRatedTvSeries, this.popularTvSeries);

  @override
  List<Object> get props =>
      [nowPlayingTvSeries, popularTvSeries, topRatedTvSeries];
}
