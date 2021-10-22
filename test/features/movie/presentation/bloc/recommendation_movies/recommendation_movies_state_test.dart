import 'package:filmov/features/movie/domain/entities/movie.dart';
import 'package:filmov/features/movie/presentation/bloc/recommendation_movies/recommendation_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeMovie extends Fake implements Movie {}

void main() {
  group('RecommendationMoviesState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(RecommendationMoviesLoading(), RecommendationMoviesLoading());
      });
    });

    group('Loaded', () {
      final movie = FakeMovie();
      final list = [movie];
      test('supports value comparison', () {
        expect(
          RecommendationMoviesLoaded(movies: list),
          RecommendationMoviesLoaded(movies: list),
        );
      });
    });

    group('RecommendationMoviesError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(RecommendationMoviesError(message: errorMessage),
            RecommendationMoviesError(message: errorMessage));
      });
    });
  });
}
