import 'package:ditonton/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesEmpty extends PopularMoviesState {}

class PopularMoviesError extends PopularMoviesState {
  final String message;
  PopularMoviesError(this.message);
}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesHasData extends PopularMoviesState {
  final List<Movie> popularMovies;
  PopularMoviesHasData(this.popularMovies);

  @override
  List<Object> get props => [popularMovies];
}
