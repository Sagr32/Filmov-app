import 'package:filmov/features/movie/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TopRated event', () {
    test('supports value comparison', () {
      expect(GetMoviesForTopRated(), GetMoviesForTopRated());
    });
  });
}
