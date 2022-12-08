import 'package:ditonton/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailEmpty extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {}

class MovieDetailHasData extends MovieDetailState {
  final Movie movieDetail;
  final List<Movie> movieRecommendation;
  final String message;
  final bool isAddedToWatchlist;

  MovieDetailHasData({
    required this.movieDetail,
    required this.movieRecommendation,
    required this.message,
    required this.isAddedToWatchlist,
  });

  @override
  List<Object> get props => [
        movieDetail,
        movieRecommendation,
        message,
        isAddedToWatchlist,
      ];
}
