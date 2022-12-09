import 'package:ditonton/domain/entities/movie_detail.dart';

abstract class WatchlistButtonEvent {
  const WatchlistButtonEvent();
}

class OnAddWatchlist extends WatchlistButtonEvent {
  final MovieDetail movieDetail;
  OnAddWatchlist(this.movieDetail);
}

class OnRemoveWatchlist extends WatchlistButtonEvent {
  final MovieDetail movieDetail;
  OnRemoveWatchlist(this.movieDetail);
}

class OnFetchWatchlistStatus extends WatchlistButtonEvent {
  final int movieId;
  OnFetchWatchlistStatus(this.movieId);
}
