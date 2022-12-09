import 'package:ditonton/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRatedMoviesEmpty extends TopRatedMoviesState {}

class TopRatedMoviesError extends TopRatedMoviesState {
  final String message;
  TopRatedMoviesError(this.message);
}

class TopRatedMoviesLoading extends TopRatedMoviesState {}

class TopRatedMoviesHasData extends TopRatedMoviesState {
  final List<Movie> topRatedMovies;
  TopRatedMoviesHasData(this.topRatedMovies);

  @override
  List<Object> get props => [topRatedMovies];
}
