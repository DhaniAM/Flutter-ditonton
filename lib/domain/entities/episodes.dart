import 'package:equatable/equatable.dart';

class Episodes extends Equatable {
  Episodes({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  String airDate;
  int episodeNumber;
  int id;
  String name;
  String overview;
  String? productionCode;
  int seasonNumber;
  String? stillPath;
  double voteAverage;
  int voteCount;

  @override
  List<Object?> get props => [
        airDate,
        episodeNumber,
        id,
        name,
        overview,
        productionCode,
        seasonNumber,
        stillPath,
        voteAverage,
        voteCount,
      ];
}
