import 'package:ditonton/presentation/bloc/movie/top_rated_movies_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated_movies_event.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated_movies_state.dart';
import 'package:ditonton/presentation/widgets/content_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-movie';

  @override
  _TopRatedMoviesPageState createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  @override
  void initState() {
    super.initState();
    context.read<TopRatedMoviesBloc>().add(OnFetchTopRatedMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
          builder: (context, state) {
            if (state is TopRatedMoviesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedMoviesHasData) {
              final movies = state.topRatedMovies;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return ContentCardList(movie);
                },
                itemCount: movies.length,
              );

              /// When error
            } else if (state is TopRatedMoviesError) {
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
