import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  /// Call [MovieRepositoryImpl].getPopularMovies
  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getPopularMovies();
  }
}
