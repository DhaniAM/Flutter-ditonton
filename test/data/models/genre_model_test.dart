import 'package:ditonton/data/models/genre_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final genreJson = {"id": 1, "name": "name"};

  test('should return genre model', () {
    final testGenre = GenreModel(id: 1, name: "name");

    final testGenreToJson = testGenre.toJson();

    expect(testGenreToJson, genreJson);
  });
}
