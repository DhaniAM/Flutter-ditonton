import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
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
                if (movieData.state == RequestState.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (movieData.state == RequestState.loaded) {
                  List results = mergeResults(
                      movieData.searchResult, tvSeriesData.searchResult);

                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        return SearchResultList(results[index]);
                      },
                      itemCount: results.length,
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

  List mergeResults(List<Movie> movie, List<TvSeries> tvSeries) {
    List<dynamic> results = [];
    int tvSeriesLength = tvSeries.length;
    int movieLength = movie.length;
    int longest = (tvSeriesLength > movieLength) ? tvSeriesLength : movieLength;

    for (int i = 0; i < longest; i++) {
      if (i < tvSeriesLength) {
        results.add(tvSeries[i]);
      }
      if (i < movieLength) {
        results.add(movie[i]);
      }
    }

    return results;
  }
}
