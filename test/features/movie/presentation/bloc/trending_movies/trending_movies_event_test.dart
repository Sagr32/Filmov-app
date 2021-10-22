
import 'package:filmov/features/movie/presentation/bloc/trending_movies/trending_movies_bloc.dart';

import 'package:flutter_test/flutter_test.dart';


void main() {
    group('Trending event', () {
    test('supports value comparison', () {
      expect(GetMoviesForTrending(), GetMoviesForTrending());
    });
  });
}
