import 'package:ditonton/presentation/bloc/movie/now_playing_movies_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing_movies_event.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing_movies_state.dart';
import 'package:ditonton/presentation/widgets/content_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/now-playing-movies';

  @override
  _NowPlayingMoviesPageState createState() => _NowPlayingMoviesPageState();
}

class _NowPlayingMoviesPageState extends State<NowPlayingMoviesPage> {
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingMoviesBloc>().add(OnFetchNowPlayingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
          builder: (_, state) {
            if (state is NowPlayingMoviesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NowPlayingMoviesHasData) {
              final movies = state.nowPlayingMovies;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return ContentCardList(movie);
                },
                itemCount: movies.length,
              );

              /// When error
            } else if (state is NowPlayingMoviesError) {
              return Center(
                key: Key('error_message'),
                child: Text(state.message),
              );

              /// When empty
            } else {
              return Center();
            }
          },
        ),
      ),
    );
  }
}
