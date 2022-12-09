import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_movie_watchlist_status.dart';
import 'package:ditonton/presentation/bloc/movie/movie_detail_event.dart';
import 'package:ditonton/presentation/bloc/movie/movie_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetMovieWatchListStatus getMovieWatchListStatus;

  MovieDetailBloc({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
    required this.getMovieWatchListStatus,
  }) : super(MovieDetailEmpty()) {
    on<OnFetchMovieDetail>((event, emit) async {
      emit(MovieDetailLoading());
      final movieId = event.movieId;
      final detailResult = await getMovieDetail.execute(movieId);
      final recommendationResult =
          await getMovieRecommendations.execute(movieId);

      detailResult.fold(
        (failure) {
          emit(MovieDetailError(failure.message));
        },
        (movie) {
          recommendationResult.fold(
            (failure) {
              emit(MovieDetailError(failure.message));
            },
            (movies) {
              emit(MovieDetailHasData(
                movieDetail: movie,
                movieRecommendation: movies,
              ));
            },
          );
        },
      );
    });
  }
}
