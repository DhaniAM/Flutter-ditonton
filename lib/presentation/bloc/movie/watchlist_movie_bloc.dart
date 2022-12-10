import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist_movie_event.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistMoviesBloc
    extends Bloc<WatchlistMoviesEvent, WatchlistMoviesState> {
  final GetWatchlistMovies getWatchlistMovies;

  WatchlistMoviesBloc(this.getWatchlistMovies) : super(WatchlistMoviesEmpty()) {
    on<OnFetchWatchlistMovies>((event, emit) async {
      emit(WatchlistMoviesLoading());
      final result = await getWatchlistMovies.execute();
      result.fold((failure) {
        emit(WatchlistMoviesError(failure.message));
      }, (movies) {
        emit(WatchlistMoviesHasData(movies));
      });
    });
  }
}
