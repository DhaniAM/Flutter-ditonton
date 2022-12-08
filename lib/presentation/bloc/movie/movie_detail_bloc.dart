import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_movie_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/save_movie_watchlist.dart';
import 'package:ditonton/presentation/bloc/movie/movie_detail_event.dart';
import 'package:ditonton/presentation/bloc/movie/movie_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetMovieWatchListStatus getMovieWatchListStatus;
  final SaveMovieWatchlist saveMovieWatchlist;
  final RemoveMovieWatchlist removeMovieWatchlist;

  MovieDetailBloc({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
    required this.getMovieWatchListStatus,
    required this.saveMovieWatchlist,
    required this.removeMovieWatchlist,
  }) : super(MovieDetailEmpty()) {
    on<OnFetchMovieDetail>((event, emit) async {
      final movieId = event.movieId;
    });

    on<OnAddToWatchlist>((event, emit) {
      final movie = event.movieDetail;
    });

    on<OnRemoveFromWatchlist>((event, emit) {
      final movie = event.movieDetail;
    });

    on<OnLoadWatchlistStatus>((event, emit) {
      final movieId = event.movieId;
    });
  }
}
