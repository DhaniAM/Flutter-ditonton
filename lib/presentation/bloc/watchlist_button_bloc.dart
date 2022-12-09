import 'package:ditonton/domain/usecases/get_movie_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/save_movie_watchlist.dart';
import 'package:ditonton/presentation/bloc/watchlist_button_event.dart';
import 'package:ditonton/presentation/bloc/watchlist_button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistButtonBloc
    extends Bloc<WatchlistButtonEvent, WatchlistButtonState> {
  final SaveMovieWatchlist saveMovieWatchlist;
  final RemoveMovieWatchlist removeMovieWatchlist;
  final GetMovieWatchListStatus getMovieWatchListStatus;

  WatchlistButtonBloc({
    required this.saveMovieWatchlist,
    required this.removeMovieWatchlist,
    required this.getMovieWatchListStatus,
  }) : super(WatchlistButtonHasData('message', false)) {
    on<OnFetchWatchlistStatus>((event, emit) async {
      final result = await getMovieWatchListStatus.execute(event.movieId);
      emit(WatchlistButtonHasData('data', result));
    });

    on<OnAddWatchlist>((event, emit) async {
      final result = await saveMovieWatchlist.execute(event.movieDetail);

      result.fold(
        (error) {
          emit(WatchlistButtonError(error.message));
        },
        (success) {
          emit(WatchlistButtonHasData(success, true));
        },
      );
    });

    on<OnRemoveWatchlist>((event, emit) async {
      final result = await removeMovieWatchlist.execute(event.movieDetail);
      result.fold(
        (error) {
          emit(WatchlistButtonError(error.message));
        },
        (success) {
          emit(WatchlistButtonHasData(success, false));
        },
      );
    });
  }
}
