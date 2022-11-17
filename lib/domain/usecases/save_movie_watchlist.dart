import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

class SaveMovieWatchlist {
  final MovieRepository repository;

  SaveMovieWatchlist(this.repository);

  /// Call [MovieRepositoryImpl].saveMoviesWatchlist(movie)
  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveMoviesWatchlist(movie);
  }
}
