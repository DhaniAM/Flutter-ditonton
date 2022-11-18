import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series_search_notifier.dart';
import 'package:ditonton/presentation/widgets/search_result_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                Provider.of<MovieSearchNotifier>(context, listen: false)
                  ..fetchMovieSearch(query);
                Provider.of<TvSeriesSearchNotifier>(context, listen: false)
                  ..fetchTvSeriesSearch(query);
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            Consumer2<MovieSearchNotifier, TvSeriesSearchNotifier>(
              builder: (context, movieData, tvSeriesData, child) {
                if (movieData.state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (movieData.state == RequestState.Loaded) {
                  final movieResult = movieData.searchResult;
                  final tvSeriesResult = tvSeriesData.searchResult;
                  final int movieLength = movieResult.length;
                  final int tvSeriesLength = tvSeriesResult.length;
                  final int contentLength = (movieLength == tvSeriesLength)
                      ? movieLength
                      : (movieLength < tvSeriesLength)
                          ? movieLength
                          : tvSeriesLength;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = movieData.searchResult[index];
                        final tvSeries = tvSeriesData.searchResult[index];
                        final List result = [movie, tvSeries];
                        return SearchResultList(result);
                      },
                      itemCount: contentLength,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
