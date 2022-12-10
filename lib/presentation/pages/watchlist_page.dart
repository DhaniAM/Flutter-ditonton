import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist_movie_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist_movie_event.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist_movie_state.dart';
import 'package:ditonton/presentation/bloc/tv_series/watchlist_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/watchlist_tv_series_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/watchlist_tv_series_state.dart';
import 'package:ditonton/presentation/widgets/content_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    context.read<WatchlistMoviesBloc>().add(OnFetchWatchlistMovies());
    context.read<WatchlistTvSeriesBloc>().add(OnFetchWatchlistTvSeries());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    context.read<WatchlistMoviesBloc>().add(OnFetchWatchlistMovies());
    context.read<WatchlistTvSeriesBloc>().add(OnFetchWatchlistTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistMoviesBloc, WatchlistMoviesState>(
          builder: (_, movieState) {
            return BlocBuilder<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
                builder: (_, tvSeriesState) {
              if (movieState is WatchlistMoviesLoading &&
                  tvSeriesState is WatchlistTvSeriesLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (movieState is WatchlistMoviesHasData &&
                  tvSeriesState is WatchlistTvSeriesHasData) {
                final List<dynamic> result = [
                  ...movieState.watchlistMovies,
                  ...tvSeriesState.watchlistMovies
                ];
                if (result.length != 0) {
                  return ListView.builder(
                    itemBuilder: (_, index) {
                      final content = result[index];
                      return ContentCardList(content);
                    },
                    itemCount: result.length,
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.credit_card_off_sharp,
                          size: 150,
                          color: Color(0x34CECECE),
                        ),
                        Text('No Watchlist'),
                      ],
                    ),
                  );
                }

                /// When error
              } else if (movieState is WatchlistMoviesError) {
                return Center(
                  key: Key('error_message'),
                  child: Text(movieState.message),
                );
              } else if (tvSeriesState is WatchlistTvSeriesError) {
                return Center(
                    key: Key('error_message'),
                    child: Text(tvSeriesState.message));

                /// When empty
              } else {
                return Center();
              }
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
