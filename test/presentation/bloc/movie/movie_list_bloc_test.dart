import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  GetNowPlayingMovies,
  GetPopularMovies,
  GetTopRatedMovies,
])
void main() {}
