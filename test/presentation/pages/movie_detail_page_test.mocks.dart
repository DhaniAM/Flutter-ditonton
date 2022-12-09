// // Mocks generated by Mockito 5.3.0 from annotations
// // in ditonton/test/presentation/pages/movie_detail_page_test.dart.
// // Do not manually edit this file.
//
// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'dart:async' as _i11;
// import 'dart:ui' as _i12;
//
// import 'package:ditonton/common/state_enum.dart' as _i9;
// import 'package:ditonton/domain/entities/movie.dart' as _i10;
// import 'package:ditonton/domain/entities/movie_detail.dart' as _i7;
// import 'package:ditonton/domain/usecases/get_movie_detail.dart' as _i2;
// import 'package:ditonton/domain/usecases/get_movie_recommendations.dart' as _i3;
// import 'package:ditonton/domain/usecases/get_movie_watchlist_status.dart'
//     as _i4;
// import 'package:ditonton/domain/usecases/remove_movie_watchlist.dart' as _i6;
// import 'package:ditonton/domain/usecases/save_movie_watchlist.dart' as _i5;
// import 'package:ditonton/presentation/provider/movie_detail_notifier.dart'
//     as _i8;
// import 'package:mockito/mockito.dart' as _i1;
//
// // ignore_for_file: type=lint
// // ignore_for_file: avoid_redundant_argument_values
// // ignore_for_file: avoid_setters_without_getters
// // ignore_for_file: comment_references
// // ignore_for_file: implementation_imports
// // ignore_for_file: invalid_use_of_visible_for_testing_member
// // ignore_for_file: prefer_const_constructors
// // ignore_for_file: unnecessary_parenthesis
// // ignore_for_file: camel_case_types
// // ignore_for_file: subtype_of_sealed_class
//
// class _FakeGetMovieDetail_0 extends _i1.SmartFake
//     implements _i2.GetMovieDetail {
//   _FakeGetMovieDetail_0(Object parent, Invocation parentInvocation)
//       : super(parent, parentInvocation);
// }
//
// class _FakeGetMovieRecommendations_1 extends _i1.SmartFake
//     implements _i3.GetMovieRecommendations {
//   _FakeGetMovieRecommendations_1(Object parent, Invocation parentInvocation)
//       : super(parent, parentInvocation);
// }
//
// class _FakeGetMovieWatchListStatus_2 extends _i1.SmartFake
//     implements _i4.GetMovieWatchListStatus {
//   _FakeGetMovieWatchListStatus_2(Object parent, Invocation parentInvocation)
//       : super(parent, parentInvocation);
// }
//
// class _FakeSaveMovieWatchlist_3 extends _i1.SmartFake
//     implements _i5.SaveMovieWatchlist {
//   _FakeSaveMovieWatchlist_3(Object parent, Invocation parentInvocation)
//       : super(parent, parentInvocation);
// }
//
// class _FakeRemoveMovieWatchlist_4 extends _i1.SmartFake
//     implements _i6.RemoveMovieWatchlist {
//   _FakeRemoveMovieWatchlist_4(Object parent, Invocation parentInvocation)
//       : super(parent, parentInvocation);
// }
//
// class _FakeMovieDetail_5 extends _i1.SmartFake implements _i7.MovieDetail {
//   _FakeMovieDetail_5(Object parent, Invocation parentInvocation)
//       : super(parent, parentInvocation);
// }
//
// /// A class which mocks [MovieDetailNotifier].
// ///
// /// See the documentation for Mockito's code generation for more information.
// class MockMovieDetailNotifier extends _i1.Mock
//     implements _i8.MovieDetailNotifier {
//   MockMovieDetailNotifier() {
//     _i1.throwOnMissingStub(this);
//   }
//
//   @override
//   _i2.GetMovieDetail get getMovieDetail => (super.noSuchMethod(
//           Invocation.getter(#getMovieDetail),
//           returnValue:
//               _FakeGetMovieDetail_0(this, Invocation.getter(#getMovieDetail)))
//       as _i2.GetMovieDetail);
//   @override
//   _i3.GetMovieRecommendations get getMovieRecommendations =>
//       (super.noSuchMethod(Invocation.getter(#getMovieRecommendations),
//               returnValue: _FakeGetMovieRecommendations_1(
//                   this, Invocation.getter(#getMovieRecommendations)))
//           as _i3.GetMovieRecommendations);
//   @override
//   _i4.GetMovieWatchListStatus get getMovieWatchListStatus =>
//       (super.noSuchMethod(Invocation.getter(#getMovieWatchListStatus),
//               returnValue: _FakeGetMovieWatchListStatus_2(
//                   this, Invocation.getter(#getMovieWatchListStatus)))
//           as _i4.GetMovieWatchListStatus);
//   @override
//   _i5.SaveMovieWatchlist get saveMovieWatchlist =>
//       (super.noSuchMethod(Invocation.getter(#saveMovieWatchlist),
//               returnValue: _FakeSaveMovieWatchlist_3(
//                   this, Invocation.getter(#saveMovieWatchlist)))
//           as _i5.SaveMovieWatchlist);
//   @override
//   _i6.RemoveMovieWatchlist get removeMovieWatchlist =>
//       (super.noSuchMethod(Invocation.getter(#removeMovieWatchlist),
//               returnValue: _FakeRemoveMovieWatchlist_4(
//                   this, Invocation.getter(#removeMovieWatchlist)))
//           as _i6.RemoveMovieWatchlist);
//   @override
//   _i7.MovieDetail get movie => (super.noSuchMethod(Invocation.getter(#movie),
//           returnValue: _FakeMovieDetail_5(this, Invocation.getter(#movie)))
//       as _i7.MovieDetail);
//   @override
//   _i9.RequestState get movieState =>
//       (super.noSuchMethod(Invocation.getter(#movieState),
//           returnValue: _i9.RequestState.empty) as _i9.RequestState);
//   @override
//   List<_i10.Movie> get movieRecommendations =>
//       (super.noSuchMethod(Invocation.getter(#movieRecommendations),
//           returnValue: <_i10.Movie>[]) as List<_i10.Movie>);
//   @override
//   _i9.RequestState get recommendationState =>
//       (super.noSuchMethod(Invocation.getter(#recommendationState),
//           returnValue: _i9.RequestState.empty) as _i9.RequestState);
//   @override
//   String get message =>
//       (super.noSuchMethod(Invocation.getter(#message), returnValue: '')
//           as String);
//   @override
//   bool get isAddedToWatchlist =>
//       (super.noSuchMethod(Invocation.getter(#isAddedToWatchlist),
//           returnValue: false) as bool);
//   @override
//   String get watchlistMessage =>
//       (super.noSuchMethod(Invocation.getter(#watchlistMessage), returnValue: '')
//           as String);
//   @override
//   bool get hasListeners =>
//       (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
//           as bool);
//   @override
//   _i11.Future<void> fetchMovieDetail(int? id) =>
//       (super.noSuchMethod(Invocation.method(#fetchMovieDetail, [id]),
//               returnValue: _i11.Future<void>.value(),
//               returnValueForMissingStub: _i11.Future<void>.value())
//           as _i11.Future<void>);
//   @override
//   _i11.Future<void> addWatchlist(_i7.MovieDetail? movie) =>
//       (super.noSuchMethod(Invocation.method(#addWatchlist, [movie]),
//               returnValue: _i11.Future<void>.value(),
//               returnValueForMissingStub: _i11.Future<void>.value())
//           as _i11.Future<void>);
//   @override
//   _i11.Future<void> removeFromWatchlist(_i7.MovieDetail? movie) =>
//       (super.noSuchMethod(Invocation.method(#removeFromWatchlist, [movie]),
//               returnValue: _i11.Future<void>.value(),
//               returnValueForMissingStub: _i11.Future<void>.value())
//           as _i11.Future<void>);
//   @override
//   _i11.Future<void> loadWatchlistStatus(int? id) =>
//       (super.noSuchMethod(Invocation.method(#loadWatchlistStatus, [id]),
//               returnValue: _i11.Future<void>.value(),
//               returnValueForMissingStub: _i11.Future<void>.value())
//           as _i11.Future<void>);
//   @override
//   void addListener(_i12.VoidCallback? listener) =>
//       super.noSuchMethod(Invocation.method(#addListener, [listener]),
//           returnValueForMissingStub: null);
//   @override
//   void removeListener(_i12.VoidCallback? listener) =>
//       super.noSuchMethod(Invocation.method(#removeListener, [listener]),
//           returnValueForMissingStub: null);
//   @override
//   void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
//       returnValueForMissingStub: null);
//   @override
//   void notifyListeners() =>
//       super.noSuchMethod(Invocation.method(#notifyListeners, []),
//           returnValueForMissingStub: null);
// }
