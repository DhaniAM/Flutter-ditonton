import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/presentation/bloc/movie/movie_list_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/movie_list_event.dart';
import 'package:ditonton/presentation/bloc/movie/movie_list_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'movie_list_bloc_test.mocks.dart';

@GenerateMocks([
  GetNowPlayingMovies,
  GetPopularMovies,
  GetTopRatedMovies,
])
void main() {
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MovieListBloc movieListBloc;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    movieListBloc = MovieListBloc(
      getTopRatedMovies: mockGetTopRatedMovies,
      getPopularMovies: mockGetPopularMovies,
      getNowPlayingMovies: mockGetNowPlayingMovies,
    );
  });

  blocTest<MovieListBloc, MovieListState>(
    'Should emit [Loading, HasData] when Movies data is success ',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return movieListBloc;
    },
    act: (bloc) => bloc.add(OnFetchMovies()),
    expect: () => [
      MovieListLoading(),
      MovieListHasData(testMovieList, testMovieList, testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
      verify(mockGetTopRatedMovies.execute());
      verify(mockGetPopularMovies.execute());
    },
  );

  blocTest<MovieListBloc, MovieListState>(
    'Should emit [Loading, Error] when Movies now playing data is failed ',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('')));
      return movieListBloc;
    },
    act: (bloc) => bloc.add(OnFetchMovies()),
    expect: () => [
      MovieListLoading(),
      MovieListError(''),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
      verify(mockGetTopRatedMovies.execute());
      verify(mockGetPopularMovies.execute());
    },
  );

  blocTest<MovieListBloc, MovieListState>(
    'Should emit [Loading, Error] when Movies popular data is failed ',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('')));
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return movieListBloc;
    },
    act: (bloc) => bloc.add(OnFetchMovies()),
    expect: () => [
      MovieListLoading(),
      MovieListError(''),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
      verify(mockGetTopRatedMovies.execute());
      verify(mockGetPopularMovies.execute());
    },
  );

  blocTest<MovieListBloc, MovieListState>(
    'Should emit [Loading, Error] when Movies top rated data is failed ',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('')));
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return movieListBloc;
    },
    act: (bloc) => bloc.add(OnFetchMovies()),
    expect: () => [
      MovieListLoading(),
      MovieListError(''),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
      verify(mockGetTopRatedMovies.execute());
      verify(mockGetPopularMovies.execute());
    },
  );
}
