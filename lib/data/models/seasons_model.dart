import 'package:ditonton/domain/entities/seasons.dart';
import 'package:equatable/equatable.dart';

class SeasonsModel extends Equatable {
  SeasonsModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  final String? airDate;
  final int? episodeCount;
  final int id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;

  /// Change to [SeasonsModel] from JSON
  factory SeasonsModel.fromJson(Map<String, dynamic> json) => SeasonsModel(
        airDate: json['air_date'],
        episodeCount: json['episode_count'],
        id: json['id'],
        title: json['name'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        seasonNumber: json['season_number'],
      );

  /// Change to [Seasons] from [SeasonsModel]
  Seasons toEntity() {
    return Seasons(
        airDate: airDate,
        episodeCount: episodeCount,
        id: id,
        title: title,
        overview: overview,
        posterPath: posterPath,
        seasonNumber: seasonNumber);
  }

  @override
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        title,
        overview,
        posterPath,
        seasonNumber,
      ];
}
