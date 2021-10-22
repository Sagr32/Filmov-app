


import 'package:filmov/features/Credits/presentation/bloc/person_details/person_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PersonDetails event', () {
    final tPersonId = "6674";

    test('supports value comparison', () {
      expect(
        GetPersonDetailsEvent(personId: tPersonId),
        GetPersonDetailsEvent(personId:tPersonId),
      );
    });
  });
}
