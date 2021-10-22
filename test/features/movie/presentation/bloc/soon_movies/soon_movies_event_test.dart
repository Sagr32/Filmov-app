import 'package:filmov/features/movie/presentation/bloc/soon_movies/soon_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Soon event', () {
    test('supports value comparison', () {
      expect(GetMoviesForSoon(), GetMoviesForSoon());
    });
  });
}
