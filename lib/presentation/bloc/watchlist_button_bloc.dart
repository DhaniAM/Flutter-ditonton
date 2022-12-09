import 'package:ditonton/domain/usecases/get_movie_watchlist_status.dart';
import 'package:ditonton/domain/usecases/get_tv_series_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/remove_tv_series_watchlist.dart';
import 'package:ditonton/domain/usecases/save_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/save_tv_series_watchlist.dart';
import 'package:ditonton/presentation/bloc/watchlist_button_event.dart';
import 'package:ditonton/presentation/bloc/watchlist_button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistButtonBloc
    extends Bloc<WatchlistButtonEvent, WatchlistButtonState> {
  final SaveMovieWatchlist saveMovieWatchlist;
  final RemoveMovieWatchlist removeMovieWatchlist;
  final GetMovieWatchListStatus getMovieWatchListStatus;
  final SaveTvSeriesWatchlist saveTvSeriesWatchlist;
  final RemoveTvSeriesWatchlist removeTvSeriesWatchlist;
  final GetTvSeriesWatchListStatus getTvSeriesWatchlistStatus;

  WatchlistButtonBloc({
    required this.saveMovieWatchlist,
    required this.removeMovieWatchlist,
    required this.getMovieWatchListStatus,
    required this.saveTvSeriesWatchlist,
    required this.removeTvSeriesWatchlist,
    required this.getTvSeriesWatchlistStatus,
  }) : super(WatchlistButtonHasData('', false)) {
    on<OnFetchMovieWatchlistStatus>((event, emit) async {
      final result = await getMovieWatchListStatus.execute(event.movieId);
      emit(WatchlistButtonHasData('', result));
    });

    on<OnAddMovieWatchlist>((event, emit) async {
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

    on<OnRemoveMovieWatchlist>((event, emit) async {
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

    on<OnFetchTvSeriesWatchlistStatus>((event, emit) async {
      final result = await getTvSeriesWatchlistStatus.execute(event.tvSeriesId);
      emit(WatchlistButtonHasData('', result));
    });

    on<OnAddTvSeriesWatchlist>((event, emit) async {
      final result = await saveTvSeriesWatchlist.execute(event.tvSeriesDetail);

      result.fold(
        (error) {
          emit(WatchlistButtonError(error.message));
        },
        (success) {
          emit(WatchlistButtonHasData(success, true));
        },
      );
    });

    on<OnRemoveTvSeriesWatchlist>((event, emit) async {
      final result =
          await removeTvSeriesWatchlist.execute(event.tvSeriesDetail);
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
