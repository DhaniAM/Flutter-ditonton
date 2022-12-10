import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:equatable/equatable.dart';

abstract class NowPlayingTvSeriesState extends Equatable {
  const NowPlayingTvSeriesState();

  @override
  List<Object> get props => [];
}

class NowPlayingTvSeriesEmpty extends NowPlayingTvSeriesState {}

class NowPlayingTvSeriesLoading extends NowPlayingTvSeriesState {}

class NowPlayingTvSeriesError extends NowPlayingTvSeriesState {
  final String message;
  NowPlayingTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class NowPlayingTvSeriesHasData extends NowPlayingTvSeriesState {
  final List<TvSeries> nowPlayingTvSeries;
  NowPlayingTvSeriesHasData(this.nowPlayingTvSeries);

  @override
  List<Object> get props => [nowPlayingTvSeries];
}
