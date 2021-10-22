import 'dart:convert';

import 'package:filmov/features/movie/data/models/movie_model.dart';
import 'package:filmov/features/movie/domain/entities/movie.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture_reader.dart';
import '../../../../test_constants.dart';

void main() {
  test(
    "Should be a subclass of Movie entity",
    () {
      expect(tMoviesModel[0], isA<Movie>());
    },
  );

  group(
    "From Json",
    () {
      test(
        "Should return a valid model from json",
        () async {
          final Map<String, dynamic> jsonMap =
              json.decode(await fixture(fileName: "movie"));

          // act
          final result = MovieModel.fromJson(jsonMap);
          // assert
          expect(result, tMoviesModel[0]);
        },
      );
    },
  );

  group(
    "To Json",
    () {
      test(
        "Should return a valid model from json",
        () {
          // act
          final expectedResult = {
            "adult": false,
            "backdrop_path": "backdrop path test",
            "id": 436969,
            "original_language": "en",
            "overview": "The Suicide Squad overview",
            "popularity": 1723.518,
            "poster_path": "poster path test",
            "release_date": "2021-07-28",
            "title": "The Suicide Squad",
            "vote_average": 7.8,
            "vote_count": 4205,
            'genre_ids': [28, 12, 14, 35]
          };
          final result = tMoviesModel[0].toJson();
          // assert
          expect(result, expectedResult);
        },
      );
    },
  );
}
