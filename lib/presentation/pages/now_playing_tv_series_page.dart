import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_event.dart';
import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_state.dart';
import 'package:ditonton/presentation/widgets/content_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/now-playing-tv-series';

  @override
  _NowPlayingTvSeriesPageState createState() => _NowPlayingTvSeriesPageState();
}

class _NowPlayingTvSeriesPageState extends State<NowPlayingTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingTvSeriesBloc>().add(OnFetchNowPlayingTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NowPlayingTvSeriesBloc, NowPlayingTvSeriesState>(
          builder: (context, state) {
            if (state is NowPlayingTvSeriesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NowPlayingTvSeriesHasData) {
              final tv = state.nowPlayingTvSeries;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = tv[index];
                  return ContentCardList(tvSeries);
                },
                itemCount: tv.length,
              );

              /// When error
            } else if (state is NowPlayingTvSeriesError) {
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
