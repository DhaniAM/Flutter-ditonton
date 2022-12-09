import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing_movies_event.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingMoviesBloc(this.getNowPlayingMovies)
      : super(NowPlayingMoviesEmpty()) {
    on<OnFetchNowPlayingMovies>((event, emit) async {
      emit(NowPlayingMoviesLoading());
      final result = await getNowPlayingMovies.execute();
      result.fold((failure) {
        emit(NowPlayingMoviesError(failure.message));
      }, (movie) {
        emit(NowPlayingMoviesHasData(movie));
      });
    });
  }
}
