import 'package:ditonton/domain/entities/seasons.dart';
import 'package:equatable/equatable.dart';

class SeasonsModel extends Equatable {
  SeasonsModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  final String airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;

  factory SeasonsModel.fromJson(Map<String, dynamic> json) => SeasonsModel(
        airDate: json['air_date'],
        episodeCount: json['episode_count'],
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        seasonNumber: json['season_number'],
      );

  Map<String, dynamic> toJson() => {
        'airDate': airDate,
        'episodeCount': episodeCount,
        'id': id,
        'name': name,
        'overview': overview,
        'posterPath': posterPath,
        'seasonNumber': seasonNumber,
      };

  Seasons toEntity() {
    return Seasons(
        airDate: airDate,
        episodeCount: episodeCount,
        id: id,
        title: name,
        overview: overview,
        posterPath: posterPath,
        seasonNumber: seasonNumber);
  }

  List<Object> get props => [
        airDate,
        episodeCount,
        id,
        name,
        overview,
        posterPath,
        seasonNumber,
      ];
}
