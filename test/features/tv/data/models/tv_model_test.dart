import 'dart:convert';

import 'package:filmov/features/tv/data/models/tv_model.dart';
import 'package:filmov/features/tv/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final tTvModel = TvModel(
    genreIds: [10759, 9648, 18],
    originalName: "오징어 게임",
    name: "Squid Game",
    id: 93405,
    posterPath: "/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg",
    firstAirDate: "2021-09-17",
    voteAverage: 7.9,
    overview:
        "Hundreds of cash-strapped players accept a strange invitation to compete in children's games—with high stakes. But, a tempting prize awaits the victor.",
    voteCount: 7127,
    originCountry: ["KR"],
    backdropPath: "/oaGvjB0DvdhXhOAuADfHb261ZHa.jpg",
    originalLanguage: "ko",
    popularity: 7949.302,
  );

  test('should be a subclass of Tv entity', () {
    expect(tTvModel, isA<Tv>());
  });

  group('from json', () {
    test('should return a valid tv model from json', () async {
      //
      final Map<String, dynamic> jsonMap =
          json.decode(await fixture(fileName: "tv"));
      //
      final result = TvModel.fromJson(jsonMap);
      //
      expect(result, tTvModel);
    });
  });

  group('to json', () {
    test('should return a valid json from tv model', () {
      //
      final expectedResult = {
        "genre_ids": [10759, 9648, 18],
        "original_name": "오징어 게임",
        "name": "Squid Game",
        "id": 93405,
        "poster_path": "/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg",
        "first_air_date": "2021-09-17",
        "vote_average": 7.9,
        "overview":
            "Hundreds of cash-strapped players accept a strange invitation to compete in children's games—with high stakes. But, a tempting prize awaits the victor.",
        "vote_count": 7127,
        "origin_country": ["KR"],
        "backdrop_path": "/oaGvjB0DvdhXhOAuADfHb261ZHa.jpg",
        "original_language": "ko",
        "popularity": 7949.302,
      };
      //
      final result = tTvModel.toJson();
      //
      expect(result, expectedResult);
    });
  });
}
