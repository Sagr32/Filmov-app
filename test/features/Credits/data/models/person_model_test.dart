import 'dart:convert';

import 'package:filmov/features/Credits/data/models/person_model.dart';
import 'package:filmov/features/Credits/domain/entities/person.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final tPersonModel = PersonModel(
    adult: false,
    alsoKnownAs: ["Ryan Rodney Reynolds"],
    biography: "biography",
    birthday: "1976-10-23",
    deathday: "null",
    gender: 2,
    homepage: "nll",
    id: 15,
    imdbId: "6059",
    knownForDepartment: "Acting",
    name: "Ryan Reynolds",
    placeOfBirth: "Canada",
    popularity: 156.2,
    profilePath: "profilePath",
  );

  test('should be a subclass of [Person]', () {
    expect(tPersonModel, isA<Person>());
  });

  group('From Json', () {
    test(
      "Should return a valid model from json",
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(await fixture(fileName: "person"));
        // act
        final result = PersonModel.fromJson(jsonMap);
        // assert
        expect(result, tPersonModel);
      },
    );
  });

  group("to Json", () {
    test("Should return a valid json from a model", () {
      //
      final expectedResult = {
        "adult": false,
        "also_known_as": ["Ryan Rodney Reynolds"],
        "biography": "biography",
        "birthday": "1976-10-23",
        "deathday": "null",
        "gender": 2,
        "homepage": "nll",
        "id": 15,
        "imdb_id": "6059",
        "known_for_department": "Acting",
        "name": "Ryan Reynolds",
        "place_of_birth": "Canada",
        "popularity": 156.2,
        "profile_path": "profilePath"
      };
//
      final result = tPersonModel.toJson();
      //
      expect(result, expectedResult);
    });
  });
}
