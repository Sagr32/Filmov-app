import 'package:filmov/features/movie/presentation/bloc/recommendation_movies/recommendation_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Recommendation event', () {
    final String movieId = "123";
    test('supports value comparison', () {
      expect(GetMoviesForRecommendation(movieId: movieId), GetMoviesForRecommendation(movieId: movieId));
    });
  });
}
