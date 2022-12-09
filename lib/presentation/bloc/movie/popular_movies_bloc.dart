import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/presentation/bloc/movie/popular_movies_event.dart';
import 'package:ditonton/presentation/bloc/movie/popular_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesEmpty()) {
    on<OnFetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      final result = await getPopularMovies.execute();
      result.fold((failure) {
        emit(PopularMoviesError(failure.message));
      }, (movie) {
        emit(PopularMoviesHasData(movie));
      });
    });
  }
}
