import 'package:ditonton/domain/entities/movie_detail.dart';

abstract class MovieDetailEvent {
  const MovieDetailEvent();
}

class OnFetchMovieDetail extends MovieDetailEvent {
  final int movieId;
  OnFetchMovieDetail(this.movieId);
}

class OnAddToWatchlist extends MovieDetailEvent {
  final MovieDetail movieDetail;
  OnAddToWatchlist(this.movieDetail);
}

class OnRemoveFromWatchlist extends MovieDetailEvent {
  final MovieDetail movieDetail;
  OnRemoveFromWatchlist(this.movieDetail);
}

class OnLoadWatchlistStatus extends MovieDetailEvent {
  final int movieId;
  OnLoadWatchlistStatus(this.movieId);
}
