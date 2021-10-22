

import 'package:filmov/features/Credits/domain/entities/person.dart';
import 'package:filmov/features/Credits/presentation/bloc/person_details/person_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakePerson extends Fake implements Person {}

void main() {

  group('PersonDetailsState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(PersonDetailsLoading(), PersonDetailsLoading());
      });
    });

    group('Loaded', () {
      final person = FakePerson();

      test('supports value comparison', () {
        expect(
          PersonDetailsLoaded(person: person),
          PersonDetailsLoaded(person:person),
        );
      });
    });

    group('PersonDetailsError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(PersonDetailsError(message: errorMessage),
            PersonDetailsError(message: errorMessage));
      });
    });
  });
}
