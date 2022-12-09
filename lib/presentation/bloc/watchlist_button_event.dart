import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';

abstract class WatchlistButtonEvent {
  const WatchlistButtonEvent();
}

/// Movie
class OnAddMovieWatchlist extends WatchlistButtonEvent {
  final MovieDetail movieDetail;
  OnAddMovieWatchlist(this.movieDetail);
}

class OnRemoveMovieWatchlist extends WatchlistButtonEvent {
  final MovieDetail movieDetail;
  OnRemoveMovieWatchlist(this.movieDetail);
}

class OnFetchMovieWatchlistStatus extends WatchlistButtonEvent {
  final int movieId;
  OnFetchMovieWatchlistStatus(this.movieId);
}

/// Tv series

class OnAddTvSeriesWatchlist extends WatchlistButtonEvent {
  final TvSeriesDetail tvSeriesDetail;
  OnAddTvSeriesWatchlist(this.tvSeriesDetail);
}

class OnRemoveTvSeriesWatchlist extends WatchlistButtonEvent {
  final TvSeriesDetail tvSeriesDetail;
  OnRemoveTvSeriesWatchlist(this.tvSeriesDetail);
}

class OnFetchTvSeriesWatchlistStatus extends WatchlistButtonEvent {
  final int tvSeriesId;
  OnFetchTvSeriesWatchlistStatus(this.tvSeriesId);
}
