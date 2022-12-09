import 'package:ditonton/presentation/bloc/movie/popular_movies_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/popular_movies_event.dart';
import 'package:ditonton/presentation/bloc/movie/popular_movies_state.dart';
import 'package:ditonton/presentation/widgets/content_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PopularMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-movie';

  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    context.read<PopularMoviesBloc>().add(OnFetchPopularMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (_, state) {
            if (state is PopularMoviesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularMoviesHasData) {
              final movies = state.popularMovies;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return ContentCardList(movie);
                },
                itemCount: movies.length,
              );

              /// When error
            } else if (state is PopularMoviesError) {
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
