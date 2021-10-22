import 'package:filmov/features/movie/domain/entities/movie.dart';
import 'package:filmov/features/movie/presentation/bloc/movies_for_person/movies_for_person_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FakeMovie extends Fake implements Movie {}

void main() {
  group('MoviesForPersonState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(MoviesForPersonLoading(), MoviesForPersonLoading());
      });
    });

    group('Loaded', () {
      final movie = FakeMovie();
      final list = [movie];
      test('supports value comparison', () {
        expect(
          MoviesForPersonLoaded(movies: list),
          MoviesForPersonLoaded(movies: list),
        );
      });
    });

    group('MoviesForPersonError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(MoviesForPersonError(message: errorMessage),
            MoviesForPersonError(message: errorMessage));
      });
    });
  });
}
