import 'package:filmov/features/Credits/presentation/bloc/movie_credit/movie_credit_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieCredit event', () {
    final tMovieId = "6674";

    test('supports value comparison', () {
      expect(
        GetMovieCreditEvent(movieId: tMovieId),
        GetMovieCreditEvent(movieId: tMovieId),
      );
    });
  });
}
