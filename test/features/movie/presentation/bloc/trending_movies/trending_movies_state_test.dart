import 'package:filmov/features/movie/domain/entities/movie.dart';
import 'package:filmov/features/movie/presentation/bloc/trending_movies/trending_movies_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FakeMovie extends Fake implements Movie {}

void main() {
  group('TrendingMoviesState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(TrendingMoviesLoading(), TrendingMoviesLoading());
      });
    });

    group('Loaded', () {
      final movie = FakeMovie();
      final list = [movie];
      test('supports value comparison', () {
        expect(
          TrendingMoviesLoaded(movies: list),
          TrendingMoviesLoaded(movies: list),
        );
      });
    });

    group('TrendingMoviesError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(TrendingMoviesError(message: errorMessage),
            TrendingMoviesError(message: errorMessage));
      });
    });
  });
}
