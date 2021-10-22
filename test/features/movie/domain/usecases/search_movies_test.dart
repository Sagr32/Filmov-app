import 'package:dartz/dartz.dart';

import 'package:filmov/features/movie/domain/repositories/movie_repository.dart';
import 'package:filmov/features/movie/domain/usecases/search_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_constants.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MockMovieRepository repository;

  late SearchMovies usecase;
  setUp(() {
    repository = MockMovieRepository();
    usecase = SearchMovies(repository);
  });

  test(
    "should get a list of movies from searching",
    () async {
      //arrange
      when(() => repository.searchMovies(query: tQuery))
          .thenAnswer((_) async => Right(tMovies));
      //act
      final result = await usecase(Params(tQuery));
      //assert
      verify(() => repository.searchMovies(query: tQuery));
      expect(result, Right(tMovies));
      verifyNoMoreInteractions(repository);
    },
  );
}
