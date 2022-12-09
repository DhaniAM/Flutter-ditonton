import 'package:ditonton/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

abstract class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

class NowPlayingMoviesEmpty extends NowPlayingMoviesState {}

class NowPlayingMoviesError extends NowPlayingMoviesState {
  final String message;
  NowPlayingMoviesError(this.message);
}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

class NowPlayingMoviesHasData extends NowPlayingMoviesState {
  final List<Movie> nowPlayingMovies;
  NowPlayingMoviesHasData(this.nowPlayingMovies);

  @override
  List<Object> get props => [nowPlayingMovies];
}
