import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_movie_watchlist_status.dart';
import 'package:ditonton/domain/usecases/get_tv_series_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/remove_tv_series_watchlist.dart';
import 'package:ditonton/domain/usecases/save_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/save_tv_series_watchlist.dart';
import 'package:ditonton/presentation/bloc/watchlist_button_bloc.dart';
import 'package:ditonton/presentation/bloc/watchlist_button_event.dart';
import 'package:ditonton/presentation/bloc/watchlist_button_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_button_bloc_test.mocks.dart';

@GenerateMocks([
  GetMovieWatchListStatus,
  GetTvSeriesWatchListStatus,
  SaveMovieWatchlist,
  RemoveMovieWatchlist,
  SaveTvSeriesWatchlist,
  RemoveTvSeriesWatchlist,
])
void main() {
  late MockGetMovieWatchListStatus mockGetMovieWatchListStatus;
  late MockGetTvSeriesWatchListStatus mockGetTvSeriesWatchListStatus;
  late MockSaveMovieWatchlist mockSaveMovieWatchlist;
  late MockSaveTvSeriesWatchlist mockSaveTvSeriesWatchlist;
  late MockRemoveMovieWatchlist mockRemoveMovieWatchlist;
  late MockRemoveTvSeriesWatchlist mockRemoveTvSeriesWatchlist;
  late WatchlistButtonBloc watchlistButtonBloc;

  setUp(() {
    mockGetMovieWatchListStatus = MockGetMovieWatchListStatus();
    mockGetTvSeriesWatchListStatus = MockGetTvSeriesWatchListStatus();
    mockSaveMovieWatchlist = MockSaveMovieWatchlist();
    mockSaveTvSeriesWatchlist = MockSaveTvSeriesWatchlist();
    mockRemoveTvSeriesWatchlist = MockRemoveTvSeriesWatchlist();
    mockRemoveMovieWatchlist = MockRemoveMovieWatchlist();
    watchlistButtonBloc = WatchlistButtonBloc(
      saveMovieWatchlist: mockSaveMovieWatchlist,
      removeMovieWatchlist: mockRemoveMovieWatchlist,
      getMovieWatchListStatus: mockGetMovieWatchListStatus,
      saveTvSeriesWatchlist: mockSaveTvSeriesWatchlist,
      removeTvSeriesWatchlist: mockRemoveTvSeriesWatchlist,
      getTvSeriesWatchlistStatus: mockGetTvSeriesWatchListStatus,
    );
  });

  final int tId = 1;

  test('initial state data should be empty', () {
    expect(watchlistButtonBloc.state, WatchlistButtonHasData('', false));
  });

  blocTest<WatchlistButtonBloc, WatchlistButtonState>(
    'Should emit [HasData] when OnFetchMovieWatchlist',
    build: () {
      when(mockGetMovieWatchListStatus.execute(tId))
          .thenAnswer((_) async => true);
      return watchlistButtonBloc;
    },
    act: (bloc) => bloc.add(OnFetchMovieWatchlistStatus(tId)),
    expect: () => [WatchlistButtonHasData('', true)],
    verify: (bloc) => verify(mockGetMovieWatchListStatus.execute(tId)),
  );

  group('OnRemoveMovieWatchlist', () {
    blocTest<WatchlistButtonBloc, WatchlistButtonState>(
      'Should emit [HasData] when remove movie from watchlist',
      build: () {
        when(mockRemoveMovieWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Right('success'));
        return watchlistButtonBloc;
      },
      act: (bloc) => bloc.add(OnRemoveMovieWatchlist(testMovieDetail)),
      expect: () => [WatchlistButtonHasData('success', false)],
      verify: (bloc) =>
          verify(mockRemoveMovieWatchlist.execute(testMovieDetail)),
    );

    blocTest<WatchlistButtonBloc, WatchlistButtonState>(
      'Should emit [Error] when try to remove movie watchlist data',
      build: () {
        when(mockRemoveMovieWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Left(ServerFailure('')));
        return watchlistButtonBloc;
      },
      act: (bloc) => bloc.add(OnRemoveMovieWatchlist(testMovieDetail)),
      expect: () => [WatchlistButtonError('')],
      verify: (bloc) =>
          verify(mockRemoveMovieWatchlist.execute(testMovieDetail)),
    );
  });

  group('OnAddMovieWatchlist', () {
    blocTest<WatchlistButtonBloc, WatchlistButtonState>(
      'Should emit [HasData] when gotten movie watchlist data',
      build: () {
        when(mockSaveMovieWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Right('success'));
        return watchlistButtonBloc;
      },
      act: (bloc) => bloc.add(OnAddMovieWatchlist(testMovieDetail)),
      expect: () => [WatchlistButtonHasData('success', true)],
      verify: (bloc) => verify(mockSaveMovieWatchlist.execute(testMovieDetail)),
    );

    blocTest<WatchlistButtonBloc, WatchlistButtonState>(
      'Should emit [Error] when try to get movie watchlist data',
      build: () {
        when(mockSaveMovieWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Left(ServerFailure('')));
        return watchlistButtonBloc;
      },
      act: (bloc) => bloc.add(OnAddMovieWatchlist(testMovieDetail)),
      expect: () => [WatchlistButtonError('')],
      verify: (bloc) => verify(mockSaveMovieWatchlist.execute(testMovieDetail)),
    );
  });

  /// tv
  blocTest<WatchlistButtonBloc, WatchlistButtonState>(
    'Should emit [HasData] when OnFetchTvSeriesWatchlist',
    build: () {
      when(mockGetTvSeriesWatchListStatus.execute(tId))
          .thenAnswer((_) async => true);
      return watchlistButtonBloc;
    },
    act: (bloc) => bloc.add(OnFetchTvSeriesWatchlistStatus(tId)),
    expect: () => [WatchlistButtonHasData('', true)],
    verify: (bloc) => verify(mockGetTvSeriesWatchListStatus.execute(tId)),
  );

  group('OnAddTvSeriesWatchlist', () {
    blocTest<WatchlistButtonBloc, WatchlistButtonState>(
      'Should emit [HasData] when gotten TvSeries watchlist data',
      build: () {
        when(mockSaveTvSeriesWatchlist.execute(testTvSeriesDetail))
            .thenAnswer((_) async => Right('success'));
        return watchlistButtonBloc;
      },
      act: (bloc) => bloc.add(OnAddTvSeriesWatchlist(testTvSeriesDetail)),
      expect: () => [WatchlistButtonHasData('success', true)],
      verify: (bloc) =>
          verify(mockSaveTvSeriesWatchlist.execute(testTvSeriesDetail)),
    );

    blocTest<WatchlistButtonBloc, WatchlistButtonState>(
      'Should emit [Error] when try to get TvSeries watchlist data',
      build: () {
        when(mockSaveTvSeriesWatchlist.execute(testTvSeriesDetail))
            .thenAnswer((_) async => Left(ServerFailure('')));
        return watchlistButtonBloc;
      },
      act: (bloc) => bloc.add(OnAddTvSeriesWatchlist(testTvSeriesDetail)),
      expect: () => [WatchlistButtonError('')],
      verify: (bloc) =>
          verify(mockSaveTvSeriesWatchlist.execute(testTvSeriesDetail)),
    );
  });

  group('OnRemoveTvSeriesWatchlist', () {
    blocTest<WatchlistButtonBloc, WatchlistButtonState>(
      'Should emit [HasData] when remove TvSeries from watchlist',
      build: () {
        when(mockRemoveTvSeriesWatchlist.execute(testTvSeriesDetail))
            .thenAnswer((_) async => Right('success'));
        return watchlistButtonBloc;
      },
      act: (bloc) => bloc.add(OnRemoveTvSeriesWatchlist(testTvSeriesDetail)),
      expect: () => [WatchlistButtonHasData('success', false)],
      verify: (bloc) =>
          verify(mockRemoveTvSeriesWatchlist.execute(testTvSeriesDetail)),
    );

    blocTest<WatchlistButtonBloc, WatchlistButtonState>(
      'Should emit [Error] when try to remove TvSeries watchlist data',
      build: () {
        when(mockRemoveTvSeriesWatchlist.execute(testTvSeriesDetail))
            .thenAnswer((_) async => Left(ServerFailure('')));
        return watchlistButtonBloc;
      },
      act: (bloc) => bloc.add(OnRemoveTvSeriesWatchlist(testTvSeriesDetail)),
      expect: () => [WatchlistButtonError('')],
      verify: (bloc) =>
          verify(mockRemoveTvSeriesWatchlist.execute(testTvSeriesDetail)),
    );
  });
}
