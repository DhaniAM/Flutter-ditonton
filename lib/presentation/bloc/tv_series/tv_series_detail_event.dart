import 'package:ditonton/domain/entities/tv_series_detail.dart';

abstract class TvSeriesDetailEvent {
  const TvSeriesDetailEvent();
}

class OnFetchTvSeriesDetail extends TvSeriesDetailEvent {
  final int tvSeriesId;
  OnFetchTvSeriesDetail(this.tvSeriesId);
}

class OnAddToWatchlist extends TvSeriesDetailEvent {
  final TvSeriesDetail tvSeriesDetail;
  OnAddToWatchlist(this.tvSeriesDetail);
}

class OnRemoveFromWatchlist extends TvSeriesDetailEvent {
  final TvSeriesDetail tvSeriesDetail;
  OnRemoveFromWatchlist(this.tvSeriesDetail);
}
