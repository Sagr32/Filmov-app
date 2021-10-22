import 'dart:convert';

import 'package:filmov/features/Credits/data/models/cast_model.dart';
import 'package:filmov/features/Credits/data/models/credit_model.dart';
import 'package:filmov/features/Credits/data/models/crew_model.dart';
import 'package:filmov/features/Credits/domain/entities/credit.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final tCreditModel = CreditModel(
    id: 1,
    cast: <CastModel>[
      CastModel(
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
          order: 1),
    ],
    crew: <CrewModel>[
      CrewModel(
        adult: false,
        gender: 1,
        id: 1,
        knownForDepartment: "Jake Johnson",
        name: "Jake Johnson",
        originalName: "Jake Johnson",
        popularity: 1.5,
        profilePath: "profilePath",
        creditId: "creditId",
        department: "department",
        job: "job",
      )
    ],
  );

  test("should be a subclass of [Credit]", () {
    expect(tCreditModel, isA<Credit>());
  });

  group("From Json", () {
    test("should return a valid model from json", () async {
      //
      final Map<String, dynamic> jsonMap =
          json.decode(await fixture(fileName: "credit"));
      //

      final myResult = CreditModel.fromJson(jsonMap);
      //
      expect(myResult, tCreditModel);
    });
  });

  group('To Json', () {
    test('Should return a valid json from model', () {
      //
      final expectedResult = {
        "id": 1,
        "cast": [
          {
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
          }
        ],
        "crew": [
          {
            "adult": false,
            "gender": 1,
            "id": 1,
            "known_for_department": "Jake Johnson",
            "name": "Jake Johnson",
            "original_name": "Jake Johnson",
            "popularity": 1.5,
            "profile_path": "profilePath",
            "credit_id": "creditId",
            "department": "department",
            "job": "job"
          }
        ]
      };
      //
      final result = tCreditModel.toJson();
//
      expect(result, expectedResult);
    });
  });
}
