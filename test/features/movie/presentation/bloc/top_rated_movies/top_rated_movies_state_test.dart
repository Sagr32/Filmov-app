import 'package:filmov/features/movie/domain/entities/movie.dart';
import 'package:filmov/features/movie/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';



class FakeMovie extends Fake implements Movie {}

void main() {
  group('TopRatedMoviesState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(TopRatedMoviesLoading(), TopRatedMoviesLoading());
      });
    });

    group('Loaded', () {
      final movie = FakeMovie();
      final list = [movie];
      test('supports value comparison', () {
        expect(
          TopRatedMoviesLoaded(movies: list),
          TopRatedMoviesLoaded(movies: list),
        );
      });
    });

    group('TopRatedMoviesError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(TopRatedMoviesError(message: errorMessage),
            TopRatedMoviesError(message: errorMessage));
      });
    });
  });
}
