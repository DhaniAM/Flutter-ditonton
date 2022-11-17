import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

class GetMovieWatchListStatus {
  final MovieRepository repository;

  GetMovieWatchListStatus(this.repository);

  /// Call [MovieRepositoryImpl].isMoviesAddedToWatchlist
  Future<bool> execute(int id) async {
    return repository.isMoviesAddedToWatchlist(id);
  }
}
