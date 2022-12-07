import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';
import 'package:ditonton/presentation/bloc/search_event.dart';
import 'package:ditonton/presentation/bloc/search_state.dart';

class SearchMovieBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies _searchMovies;

  SearchMovieBloc(this._searchMovies) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchLoading());
      final movieResult = await _searchMovies.execute(query);

      movieResult.fold(
        (failure) {
          emit(SearchError(failure.message));
        },
        (movieData) {
          emit(SearchHasData(movieData));
        },
      );
    });
  }
}

class SearchTvSeriesBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTvSeries _searchTvSeries;

  SearchTvSeriesBloc(this._searchTvSeries) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchLoading());
      final tvSeriesResult = await _searchTvSeries.execute(query);

      tvSeriesResult.fold(
        (failure) {
          emit(SearchError(failure.message));
        },
        (tvSeriesData) {
          emit(SearchHasData(tvSeriesData));
        },
      );
    });
  }
}
