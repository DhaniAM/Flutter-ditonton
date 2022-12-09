import 'package:ditonton/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListEmpty extends MovieListState {}

class MovieListError extends MovieListState {
  final String message;
  MovieListError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieListLoading extends MovieListState {}

class MovieListHasData extends MovieListState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;

  MovieListHasData(
      this.nowPlayingMovies, this.topRatedMovies, this.popularMovies);

  @override
  List<Object> get props => [nowPlayingMovies, popularMovies, topRatedMovies];
}
