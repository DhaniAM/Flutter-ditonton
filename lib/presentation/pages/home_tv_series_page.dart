import 'package:ditonton/common/constants.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_detail_state.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_list_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_list_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_list_state.dart';
import 'package:ditonton/presentation/pages/now_playing_tv_series_page.dart';
import 'package:ditonton/presentation/pages/popular_tv_series_page.dart';
import 'package:ditonton/presentation/pages/top_rated_tv_series_page.dart';
import 'package:ditonton/presentation/widgets/content_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTvSeriesPage extends StatefulWidget {
  const HomeTvSeriesPage();

  @override
  _HomeTvSeriesPageState createState() => _HomeTvSeriesPageState();
}

class _HomeTvSeriesPageState extends State<HomeTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<TvSeriesListBloc>().add(OnFetchTvSeries());
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
              onTap: () => Navigator.pushNamed(
                  context, NowPlayingTvSeriesPage.ROUTE_NAME),
            ),
            BlocBuilder<TvSeriesListBloc, TvSeriesListState>(
                builder: (context, state) {
              if (state is TvSeriesDetailLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TvSeriesListHasData) {
                return ContentCard(state.nowPlayingTvSeries);

                /// When error
              } else if (state is TvSeriesListError) {
                return Center(child: Text(state.message));

                /// When empty
              } else {
                return Center();
              }
            }),
            _buildSubHeading(
              title: 'Popular',
              onTap: () =>
                  Navigator.pushNamed(context, PopularTvSeriesPage.ROUTE_NAME),
            ),
            BlocBuilder<TvSeriesListBloc, TvSeriesListState>(
                builder: (context, state) {
              if (state is TvSeriesDetailLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TvSeriesListHasData) {
                return ContentCard(state.popularTvSeries);

                /// When error
              } else if (state is TvSeriesListError) {
                return Center(child: Text(state.message));

                /// When empty
              } else {
                return Center();
              }
            }),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, TopRatedTvSeriesPage.ROUTE_NAME),
            ),
            BlocBuilder<TvSeriesListBloc, TvSeriesListState>(
                builder: (context, state) {
              if (state is TvSeriesListLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TvSeriesListHasData) {
                return ContentCard(state.topRatedTvSeries);

                /// When error
              } else if (state is TvSeriesListError) {
                return Center(child: Text(state.message));

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
