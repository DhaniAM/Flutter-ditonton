import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/bloc/search_bloc.dart';
import 'package:ditonton/presentation/bloc/search_event.dart';
import 'package:ditonton/presentation/bloc/search_state.dart';
import 'package:ditonton/presentation/widgets/search_result_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              onChanged: (query) {
                context.read<SearchMovieBloc>().add(OnQueryChanged(query));
                context.read<SearchTvSeriesBloc>().add(OnQueryChanged(query));
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
            BlocBuilder<SearchMovieBloc, SearchState>(
              builder: (_, movieState) {
                return BlocBuilder<SearchTvSeriesBloc, SearchState>(
                    builder: (_, tvSeriesState) {
                  if (movieState is SearchLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (movieState is SearchHasData &&
                      tvSeriesState is SearchHasData) {
                    final List<Movie> movie = movieState.result as List<Movie>;
                    final List<TvSeries> tvSeries =
                        tvSeriesState.result as List<TvSeries>;
                    List results = mergeResults(movie, tvSeries);

                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          return SearchResultList(results[index]);
                        },
                        itemCount: results.length,
                      ),
                    );
                  } else if (movieState is SearchError) {
                    return Expanded(
                      child: Center(
                        child: Text(movieState.message),
                      ),
                    );
                  } else {
                    return Center();
                  }
                });
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
      if (i < movieLength) {
        results.add(movie[i]);
      }
      if (i < tvSeriesLength) {
        results.add(tvSeries[i]);
      }
    }

    return results;
  }
}
