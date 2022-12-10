import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/popular_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/popular_tv_series_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/popular_tv_series_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'popular_tv_series_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTvSeries])
void main() {
  late MockGetPopularTvSeries mockGetPopularTvSeries;
  late PopularTvSeriesBloc popularTvSeriesBloc;

  setUp(() {
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    popularTvSeriesBloc = PopularTvSeriesBloc(mockGetPopularTvSeries);
  });

  blocTest<PopularTvSeriesBloc, PopularTvSeriesState>(
    'Should emit [Loading, HasData] when GetNowPlayingTvSeries data is success ',
    build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return popularTvSeriesBloc;
    },
    act: (bloc) => bloc.add(OnFetchPopularTvSeries()),
    expect: () => [
      PopularTvSeriesLoading(),
      PopularTvSeriesHasData(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvSeries.execute());
    },
  );

  blocTest<PopularTvSeriesBloc, PopularTvSeriesState>(
    'Should emit [Loading, Error] when GetNowPlayingTvSeries data is failed ',
    build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('')));
      return popularTvSeriesBloc;
    },
    act: (bloc) => bloc.add(OnFetchPopularTvSeries()),
    expect: () => [
      PopularTvSeriesLoading(),
      PopularTvSeriesError(''),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvSeries.execute());
    },
  );
}
