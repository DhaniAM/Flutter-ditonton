import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/presentation/bloc/movie/movie_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/movie_detail_event.dart';
import 'package:ditonton/presentation/bloc/movie/movie_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'movie_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
])
void main() {
  late MockGetMovieDetail mockGetMovieDetaill;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MovieDetailBloc movieDetailBloc;

  setUp(() {
    mockGetMovieDetaill = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    movieDetailBloc = MovieDetailBloc(
      getMovieDetail: mockGetMovieDetaill,
      getMovieRecommendations: mockGetMovieRecommendations,
    );
  });

  final int tId = 1;

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Loading, HasData] when MovieDetail data is success',
    build: () {
      when(mockGetMovieDetaill.execute(tId))
          .thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => Right(testMovieList));

      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(OnFetchMovieDetail(tId)),
    expect: () => [
      MovieDetailLoading(),
      MovieDetailHasData(
        movieDetail: testMovieDetail,
        movieRecommendation: testMovieList,
      ),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetaill.execute(tId));
      verify(mockGetMovieRecommendations.execute(tId));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Loading, HasData] when MovieDetail data is failed',
    build: () {
      when(mockGetMovieDetaill.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('')));
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => Right(testMovieList));

      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(OnFetchMovieDetail(tId)),
    expect: () => [MovieDetailLoading(), MovieDetailError('')],
    verify: (bloc) {
      verify(mockGetMovieDetaill.execute(tId));
      verify(mockGetMovieRecommendations.execute(tId));
    },
  );
  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Loading, HasData] when MovieRecom data is failed',
    build: () {
      when(mockGetMovieDetaill.execute(tId))
          .thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('')));

      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(OnFetchMovieDetail(tId)),
    expect: () => [MovieDetailLoading(), MovieDetailError('')],
    verify: (bloc) {
      verify(mockGetMovieDetaill.execute(tId));
      verify(mockGetMovieRecommendations.execute(tId));
    },
  );
}
