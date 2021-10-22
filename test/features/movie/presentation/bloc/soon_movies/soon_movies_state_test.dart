import 'package:filmov/features/movie/domain/entities/movie.dart';
import 'package:filmov/features/movie/presentation/bloc/soon_movies/soon_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FakeMovie extends Fake implements Movie {}

void main() {
  group('SoonMoviesState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(SoonMoviesLoading(), SoonMoviesLoading());
      });
    });

    group('Loaded', () {
      final movie = FakeMovie();
      final list = [movie];
      test('supports value comparison', () {
        expect(
          SoonMoviesLoaded(movies: list),
          SoonMoviesLoaded(movies: list),
        );
      });
    });

    group('SoonMoviesError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(SoonMoviesError(message: errorMessage),
            SoonMoviesError(message: errorMessage));
      });
    });
  });
}
