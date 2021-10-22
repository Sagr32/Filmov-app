import 'dart:convert';

import 'package:filmov/features/Credits/data/models/crew_model.dart';
import 'package:filmov/features/Credits/domain/entities/crew.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final tCrewModel = CrewModel(
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
  );

  test("should be a subclass of Crew", () {
    expect(tCrewModel, isA<Crew>());
  });

  group('From Json', () {
    test(
      "Should return a valid model from json",
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(await fixture(fileName: "crew"));
        // act
        final result = CrewModel.fromJson(jsonMap);
        // assert
        expect(result, tCrewModel);
      },
    );
  });

  group("to Json", () {
    test('should return valid json from model', () {
      //
      final expectedResult = {
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
      };
      //
      final result = tCrewModel.toJson();
      //
      expect(result, expectedResult);
    });
  });
}
