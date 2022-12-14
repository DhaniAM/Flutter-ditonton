import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';
import 'package:ditonton/presentation/bloc/search_event.dart';
import 'package:ditonton/presentation/bloc/search_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchMovieBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies _searchMovies;

  SearchMovieBloc(this._searchMovies) : super(SearchEmpty()) {
    on<OnQueryChanged>(
      (event, emit) async {
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
      },
      transformer: debounce(const Duration(milliseconds: 1000)),
    );
  }
}

class SearchTvSeriesBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTvSeries _searchTvSeries;

  SearchTvSeriesBloc(this._searchTvSeries) : super(SearchEmpty()) {
    on<OnQueryChanged>(
      (event, emit) async {
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
      },
      transformer: debounce(const Duration(milliseconds: 1000)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
