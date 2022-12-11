import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/get_tv_series_watchlist_status.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_detail_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetail,
  GetTvSeriesRecommendations,
  GetTvSeriesWatchListStatus,
])
void main() {
  late MockGetTvSeriesDetail mockGetTvSeriesDetaill;
  late MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations;
  late TvSeriesDetailBloc tvSeriesDetailBloc;

  setUp(() {
    mockGetTvSeriesDetaill = MockGetTvSeriesDetail();
    mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();
    tvSeriesDetailBloc = TvSeriesDetailBloc(
      getTvSeriesDetail: mockGetTvSeriesDetaill,
      getTvSeriesRecommendations: mockGetTvSeriesRecommendations,
    );
  });

  final int tId = 1;

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Loading, HasData] when TvSeriesDetail data is success',
    build: () {
      when(mockGetTvSeriesDetaill.execute(tId))
          .thenAnswer((_) async => Right(testTvSeriesDetail));
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Right(testTvSeriesList));

      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(OnFetchTvSeriesDetail(tId)),
    expect: () => [
      TvSeriesDetailLoading(),
      TvSeriesDetailHasData(
        tvSeriesDetail: testTvSeriesDetail,
        tvSeriesRecommendation: testTvSeriesList,
      ),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesDetaill.execute(tId));
      verify(mockGetTvSeriesRecommendations.execute(tId));
    },
  );

  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Loading, HasData] when TvSeriesDetail data is failed',
    build: () {
      when(mockGetTvSeriesDetaill.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('')));
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Right(testTvSeriesList));

      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(OnFetchTvSeriesDetail(tId)),
    expect: () => [TvSeriesDetailLoading(), TvSeriesDetailError('')],
    verify: (bloc) {
      verify(mockGetTvSeriesDetaill.execute(tId));
      verify(mockGetTvSeriesRecommendations.execute(tId));
    },
  );
  blocTest<TvSeriesDetailBloc, TvSeriesDetailState>(
    'Should emit [Loading, HasData] when TvSeriesRecom data is failed',
    build: () {
      when(mockGetTvSeriesDetaill.execute(tId))
          .thenAnswer((_) async => Right(testTvSeriesDetail));
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('')));

      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(OnFetchTvSeriesDetail(tId)),
    expect: () => [TvSeriesDetailLoading(), TvSeriesDetailError('')],
    verify: (bloc) {
      verify(mockGetTvSeriesDetaill.execute(tId));
      verify(mockGetTvSeriesRecommendations.execute(tId));
    },
  );
}
