import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/tv_series_detail_page.dart';
import 'package:flutter/material.dart';

class SearchResultList extends StatelessWidget {
  final List content;
  late final Movie content1 = content[0];
  late final TvSeries content2 = content[1];

  SearchResultList(this.content);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                MovieDetailPage.ROUTE_NAME,
                arguments: content1.id,
              );
            },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Card(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      left: 16 + 80 + 16,
                      bottom: 8,
                      right: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content1.title ?? '-',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kHeading6,
                        ),
                        Text(
                          '- Movie -',
                        ),
                        SizedBox(height: 16),
                        Text(
                          (content1.overview ?? '-'),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    bottom: 16,
                  ),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: '$BASE_IMAGE_URL${content1.posterPath}',
                      width: 80,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                TvSeriesDetailPage.ROUTE_NAME,
                arguments: content2.id,
              );
            },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Card(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      left: 16 + 80 + 16,
                      bottom: 8,
                      right: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content2.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kHeading6,
                        ),
                        Text(
                          '- Tv Series -',
                        ),
                        SizedBox(height: 16),
                        Text(
                          (content2.overview),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    bottom: 16,
                  ),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: '$BASE_IMAGE_URL${content2.posterPath}',
                      width: 80,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
