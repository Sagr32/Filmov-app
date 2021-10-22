
import 'package:filmov/features/movie/domain/entities/movie.dart';
import 'package:filmov/features/movie/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FakeMovie extends Fake implements Movie {}

void main() {
  group('State', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(Loading(), Loading());
      });
    });

    group('Loaded', () {
      final movie = FakeMovie();
      final list = [movie];
      test('supports value comparison', () {
        expect(
          Loaded(movies: list),
          Loaded(movies: list),
        );
      });
    });

    group('Error', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(Error(message: errorMessage),
            Error(message: errorMessage));
      });
    });
  });
}
