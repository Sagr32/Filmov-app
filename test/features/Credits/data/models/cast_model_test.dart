import 'dart:convert';

import 'package:filmov/features/Credits/data/models/cast_model.dart';
import 'package:filmov/features/Credits/domain/entities/cast.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final tCastModel = CastModel(
      adult: false,
      gender: 1,
      id: 1,
      knownForDepartment: "Ellie",
      name: "Ellie Kemper",
      originalName: "Ellie Kemper",
      popularity: 1.5,
      profilePath: "profilePath",
      castId: 6,
      character: "character",
      creditId: "22",
      order: 1);

  test(
    "should be a subclass of [Cast]",
    () {
      expect(tCastModel, isA<Cast>());
    },
  );
  group('From Json', () {
    test(
      "Should return a valid model from json",
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(await fixture(fileName: "cast"));
        // act
        final result = CastModel.fromJson(jsonMap);
        // assert
        expect(result, tCastModel);
      },
    );
  });

  group('To Json', () {
    test('Should return a valid json from model', () {
      //
      final expectedResult = {
        "adult": false,
        "gender": 1,
        "id": 1,
        "known_for_department": "Ellie",
        "name": "Ellie Kemper",
        "original_name": "Ellie Kemper",
        "popularity": 1.5,
        "profile_path": "profilePath",
        "cast_id": 6,
        "character": "character",
        "credit_id": "22",
        "order": 1
      };
      //
      final result = tCastModel.toJson();
//
      expect(result, expectedResult);
    });
  });
}
