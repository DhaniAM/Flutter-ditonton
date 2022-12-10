import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_now_playing_tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'now_playing_tv_series_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvSeries])
void main() {
  late NowPlayingTvSeriesBloc nowPlayingTvSeriesBloc;
  late MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries;

  setUp(() {
    mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();
    nowPlayingTvSeriesBloc = NowPlayingTvSeriesBloc(mockGetNowPlayingTvSeries);
  });

  blocTest<NowPlayingTvSeriesBloc, NowPlayingTvSeriesState>(
    'Should emit [Loading, HasData] when NowPlayingTvSeries data is success',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return nowPlayingTvSeriesBloc;
    },
    act: (bloc) => bloc.add(OnFetchNowPlayingTvSeries()),
    expect: () => [
      NowPlayingTvSeriesLoading(),
      NowPlayingTvSeriesHasData(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
    },
  );

  blocTest<NowPlayingTvSeriesBloc, NowPlayingTvSeriesState>(
    'Should emit [Loading, Error] when NowPlayingTvSeries data is failed',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('')));
      return nowPlayingTvSeriesBloc;
    },
    act: (bloc) => bloc.add(OnFetchNowPlayingTvSeries()),
    expect: () => [
      NowPlayingTvSeriesLoading(),
      NowPlayingTvSeriesError(''),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
    },
  );
}
