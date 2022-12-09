import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/presentation/bloc/movie/movie_list_event.dart';
import 'package:ditonton/presentation/bloc/movie/movie_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;

  MovieListBloc({
    required this.getTopRatedMovies,
    required this.getPopularMovies,
    required this.getNowPlayingMovies,
  }) : super(MovieListEmpty()) {
    on<OnFetchMovies>((event, emit) async {
      emit(MovieListLoading());
      final nowPlaying = await getNowPlayingMovies.execute();
      final popular = await getPopularMovies.execute();
      final topRated = await getTopRatedMovies.execute();

      nowPlaying.fold((failure) {
        emit(MovieListError(failure.message));
      }, (nowPlayingMovies) {
        popular.fold((failure) {
          emit(MovieListError(failure.message));
        }, (popularMovies) {
          topRated.fold((failure) {
            emit(MovieListError(failure.message));
          }, (topRatedMovies) {
            emit(MovieListHasData(
                nowPlayingMovies, topRatedMovies, popularMovies));
          });
        });
      });
    });
  }
}
