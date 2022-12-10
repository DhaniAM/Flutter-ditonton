import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_now_playing_tv_series.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_list_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_list_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_list_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'now_playing_tv_series_bloc_test.mocks.dart';
import 'popular_tv_series_bloc_test.mocks.dart';
import 'top_rated_tv_series_bloc_test.mocks.dart';

@GenerateMocks([
  GetNowPlayingTvSeries,
  GetPopularTvSeries,
  GetTopRatedTvSeries,
])
void main() {
  late MockGetPopularTvSeries mockGetPopularTvSeries;
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;
  late MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries;
  late TvSeriesListBloc tvSeriesListBloc;

  setUp(() {
    mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    tvSeriesListBloc = TvSeriesListBloc(
      getTopRatedTvSeries: mockGetTopRatedTvSeries,
      getPopularTvSeries: mockGetPopularTvSeries,
      getNowPlayingTvSeries: mockGetNowPlayingTvSeries,
    );
  });

  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'Should emit [Loading, HasData] when TvSeries data is success ',
    build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvSeriesListBloc;
    },
    act: (bloc) => bloc.add(OnFetchTvSeries()),
    expect: () => [
      TvSeriesListLoading(),
      TvSeriesListHasData(testTvSeriesList, testTvSeriesList, testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
      verify(mockGetTopRatedTvSeries.execute());
      verify(mockGetPopularTvSeries.execute());
    },
  );

  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'Should emit [Loading, Error] when TvSeries now playing data is failed ',
    build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('')));
      return tvSeriesListBloc;
    },
    act: (bloc) => bloc.add(OnFetchTvSeries()),
    expect: () => [
      TvSeriesListLoading(),
      TvSeriesListError(''),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
      verify(mockGetTopRatedTvSeries.execute());
      verify(mockGetPopularTvSeries.execute());
    },
  );
  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'Should emit [Loading, Error] when TvSeries popular data is failed ',
    build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('')));
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvSeriesListBloc;
    },
    act: (bloc) => bloc.add(OnFetchTvSeries()),
    expect: () => [
      TvSeriesListLoading(),
      TvSeriesListError(''),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
      verify(mockGetTopRatedTvSeries.execute());
      verify(mockGetPopularTvSeries.execute());
    },
  );
  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'Should emit [Loading, Error] when TvSeries top rated data is failed ',
    build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('')));
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return tvSeriesListBloc;
    },
    act: (bloc) => bloc.add(OnFetchTvSeries()),
    expect: () => [
      TvSeriesListLoading(),
      TvSeriesListError(''),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
      verify(mockGetTopRatedTvSeries.execute());
      verify(mockGetPopularTvSeries.execute());
    },
  );
}
