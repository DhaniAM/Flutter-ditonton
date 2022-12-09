import 'package:ditonton/common/constants.dart';
import 'package:ditonton/presentation/bloc/movie/movie_list_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/movie_list_event.dart';
import 'package:ditonton/presentation/bloc/movie/movie_list_state.dart';
import 'package:ditonton/presentation/pages/now_playing_movies_page.dart';
import 'package:ditonton/presentation/pages/popular_movies_page.dart';
import 'package:ditonton/presentation/pages/top_rated_movies_page.dart';
import 'package:ditonton/presentation/widgets/content_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage();
  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieListBloc>().add(OnFetchMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSubHeading(
              title: 'Now Playing',
              onTap: () =>
                  Navigator.pushNamed(context, NowPlayingMoviesPage.ROUTE_NAME),
            ),
            BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, movieState) {
              /// When loading
              if (movieState is MovieListLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );

                /// When has data
              } else if (movieState is MovieListHasData) {
                return ContentCard(movieState.nowPlayingMovies);

                /// When error
              } else if (movieState is MovieListError) {
                return Center(child: Text(movieState.message));

                /// When empty
              } else {
                return Center();
              }
            }),
            _buildSubHeading(
              title: 'Popular',
              onTap: () =>
                  Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
            ),
            BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, movieState) {
              /// When loading
              if (movieState is MovieListLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );

                /// When has data
              } else if (movieState is MovieListHasData) {
                return ContentCard(movieState.popularMovies);

                /// When error
              } else if (movieState is MovieListError) {
                return Center(child: Text(movieState.message));

                /// When empty
              } else {
                return Center();
              }
            }),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
            ),
            BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, movieState) {
              if (movieState is MovieListLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (movieState is MovieListHasData) {
                return ContentCard(movieState.topRatedMovies);

                /// When error
              } else if (movieState is MovieListError) {
                return Center(child: Text(movieState.message));

                /// When empty
              } else {
                return Center();
              }
            }),
          ],
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
