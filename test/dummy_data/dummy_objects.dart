import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_series_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/seasons.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
  type: 'movie',
);

final testTvSeries = TvSeries(
  posterPath: '/vC324sdfcS313vh9QXwijLIHPJp.jpg',
  popularity: 10.12,
  id: 25,
  backdropPath: '/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg',
  voteAverage: 9.8798,
  overview: 'overview',
  firstAirDate: 'firstAirDate',
  originCountry: ['originCountry'],
  genreIds: [2141, 12412],
  originalLanguage: 'originalLanguage',
  voteCount: 10,
  title: 'title',
  originalName: 'originalName',
  type: 'tvSeries',
);

final testMovieList = [testMovie];

final testTvSeriesList = [testTvSeries];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
  type: 'movie',
);

final testGenre = Genre(
  id: 21,
  name: 'Action',
);

final testSeasons = Seasons(
  airDate: 'airDate',
  episodeCount: 15,
  id: 21,
  title: 'title',
  overview: 'overview',
  posterPath: '/suopoADq0k8YZr4dQXcU6pToj6s.jpg',
  seasonNumber: 4,
);

final testTvSeriesDetail = TvSeriesDetail(
    backdropPath: '/suopoADq0k8YZr4dQXcU6pToj6s.jpg',
    firstAirDate: 'firstAirDate',
    lastAirDate: 'lastAirDate',
    genres: [
      Genre(
        id: 21,
        name: 'Action',
      )
    ],
    id: 212,
    title: 'title',
    numberOfEpisodes: 5,
    numberOfSeasons: 3,
    overview: 'overview',
    posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
    seasons: [
      Seasons(
        airDate: 'airDate',
        episodeCount: 15,
        id: 21,
        title: 'title',
        overview: 'overview',
        posterPath: '/suopoADq0k8YZr4dQXcU6pToj6s.jpg',
        seasonNumber: 4,
      )
    ],
    tagline: 'tagline',
    voteAverage: 9.6587,
    voteCount: 658,
    type: 'tvSeries');

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
  type: 'movie',
);

final testWatchlistTvSeries = TvSeries.watchlist(
  id: 212,
  posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  overview: 'overview',
  title: 'title',
  type: 'tvSeries',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
  type: 'movie',
);

final testTvSeriesTable = TvSeriesTable(
  id: 212,
  title: 'title',
  posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  overview: 'overview',
  type: 'tvSeries',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
  'type': 'movie',
};

final testTvSeriesMap = {
  'id': 212,
  'overview': 'overview',
  'posterPath': '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  'title': 'title',
  'type': 'tvSeries',
};
