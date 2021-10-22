import 'package:filmov/features/movie/presentation/bloc/movies_for_person/movies_for_person_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MoviesForPerson event', () {
    final tPersonId = "123";
    test('supports value comparison', () {
      expect(
          GetMoviesForPersonEvent(
            personId: tPersonId,
          ),
          GetMoviesForPersonEvent(
            personId: tPersonId,
          ));
    });
  });
}
