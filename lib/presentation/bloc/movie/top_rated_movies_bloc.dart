import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated_movies_event.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMovies getTopRatedMovies;

  TopRatedMoviesBloc(this.getTopRatedMovies) : super(TopRatedMoviesEmpty()) {
    on<OnFetchTopRatedMovies>((event, emit) async {
      emit(TopRatedMoviesLoading());
      final result = await getTopRatedMovies.execute();
      result.fold((failure) {
        emit(TopRatedMoviesError(failure.message));
      }, (movie) {
        emit(TopRatedMoviesHasData(movie));
      });
    });
  }
}
