import 'package:ditonton/presentation/bloc/tv_series/popular_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/popular_tv_series_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/popular_tv_series_state.dart';
import 'package:ditonton/presentation/widgets/content_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tv-series';

  @override
  _PopularTvSeriesPageState createState() => _PopularTvSeriesPageState();
}

class _PopularTvSeriesPageState extends State<PopularTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<PopularTvSeriesBloc>().add(OnFetchPopularTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvSeriesBloc, PopularTvSeriesState>(
          builder: (context, state) {
            if (state is PopularTvSeriesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularTvSeriesHasData) {
              final tv = state.popularTvSeries;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = tv[index];
                  return ContentCardList(tvSeries);
                },
                itemCount: tv.length,
              );

              /// When error
            } else if (state is PopularTvSeriesError) {
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
