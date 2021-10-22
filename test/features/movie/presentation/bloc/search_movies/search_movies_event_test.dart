import 'package:filmov/features/movie/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('Search event', () {
    final String query = "Revenant";
    test('supports value comparison', () {
      expect(GetMoviesForSearch(query: query),
          GetMoviesForSearch(query: query));
    });
  });
}
