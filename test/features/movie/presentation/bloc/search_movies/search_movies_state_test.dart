import 'package:filmov/features/movie/domain/entities/movie.dart';
import 'package:filmov/features/movie/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeMovie extends Fake implements Movie {}

void main() {
  group('SearchMoviesState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(SearchMoviesLoading(), SearchMoviesLoading());
      });
    });

    group('Loaded', () {
      final movie = FakeMovie();
      final list = [movie];
      test('supports value comparison', () {
        expect(
          SearchMoviesLoaded(movies: list),
          SearchMoviesLoaded(movies: list),
        );
      });
    });

    group('SearchMoviesError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(SearchMoviesError(message: errorMessage),
            SearchMoviesError(message: errorMessage));
      });
    });
  });
}

