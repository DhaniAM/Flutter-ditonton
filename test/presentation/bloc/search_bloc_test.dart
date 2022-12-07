import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';
import 'package:ditonton/presentation/bloc/search_bloc.dart';
import 'package:ditonton/presentation/bloc/search_event.dart';
import 'package:ditonton/presentation/bloc/search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'search_bloc_test.mocks.dart';

@GenerateMocks([SearchMovies, SearchTvSeries])
void main() {
  late SearchMovieBloc searchMovieBloc;
  late SearchTvSeriesBloc searchTvSeriesBloc;
  late MockSearchMovies mockSearchMovies;
  late MockSearchTvSeries mockSearchTvSeries;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    mockSearchTvSeries = MockSearchTvSeries();
    searchMovieBloc = SearchMovieBloc(mockSearchMovies);
    searchTvSeriesBloc = SearchTvSeriesBloc(mockSearchTvSeries);
  });

  test('initial state should be empty', () {
    expect(searchMovieBloc.state, SearchEmpty());
    expect(searchTvSeriesBloc.state, SearchEmpty());
  });

  final tMovieList = <Movie>[testMovie];
  final tTvSeriesList = <TvSeries>[testTvSeries];
  final movieQuery = 'spiderman';
  final tvQuery = 'title';

  blocTest<SearchMovieBloc, SearchState>(
    'Should emit [Loading, HasData] when Movie data is gotten successfully',
    build: () {
      when(mockSearchMovies.execute(movieQuery))
          .thenAnswer((_) async => Right(tMovieList));
      return searchMovieBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(movieQuery)),
    wait: const Duration(milliseconds: 1000),
    expect: () => [
      SearchLoading(),
      SearchHasData(tMovieList),
    ],
    verify: (bloc) {
      verify(mockSearchMovies.execute(movieQuery));
    },
  );

  blocTest<SearchTvSeriesBloc, SearchState>(
    'Should emit [Loading, HasData] when Tv Series data is gotten successfully',
    build: () {
      when(mockSearchTvSeries.execute(tvQuery))
          .thenAnswer((_) async => Right(tTvSeriesList));
      return searchTvSeriesBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(tvQuery)),
    wait: const Duration(milliseconds: 1000),
    expect: () => [
      SearchLoading(),
      SearchHasData(tTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(tvQuery));
    },
  );

  blocTest<SearchMovieBloc, SearchState>(
    'Should emit [Loading, Error] when get movie search is unsuccessful',
    build: () {
      when(mockSearchMovies.execute(movieQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return searchMovieBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(movieQuery)),
    wait: const Duration(milliseconds: 1000),
    expect: () => [
      SearchLoading(),
      SearchError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchMovies.execute(movieQuery));
    },
  );

  blocTest<SearchTvSeriesBloc, SearchState>(
    'Should emit [Loading, Error] when get tv series search is unsuccessful',
    build: () {
      when(mockSearchTvSeries.execute(tvQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return searchTvSeriesBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(tvQuery)),
    wait: const Duration(milliseconds: 1000),
    expect: () => [
      SearchLoading(),
      SearchError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(tvQuery));
    },
  );
}
