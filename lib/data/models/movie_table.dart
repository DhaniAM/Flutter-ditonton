import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:equatable/equatable.dart';

/// Data to save on Database
class MovieTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;
  final String type;

  MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.type,
  });

  /// Change from [MovieDetail] to [MovieTable], to get saved on Database
  factory MovieTable.fromEntity(MovieDetail movie) => MovieTable(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath,
        overview: movie.overview,
        type: 'movie',
      );

  /// Change to [MovieTable] from JSON/Database
  factory MovieTable.fromJson(Map<String, dynamic> map) => MovieTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
        type: 'movie',
      );

  /// Change to JSON/Database format from [MovieTable]
  /// used by [DatabaseHelper]
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'type': 'movie',
      };

  /// Change to [Movie] from [MovieTable]
  Movie toEntity() => Movie.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
        type: 'movie',
      );

  @override
  List<Object?> get props => [id, title, posterPath, overview, type];
}
