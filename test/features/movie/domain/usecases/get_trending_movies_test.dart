import 'package:dartz/dartz.dart';
import 'package:filmov/core/usecase/usecase.dart';
import 'package:filmov/features/movie/domain/repositories/movie_repository.dart';
import 'package:filmov/features/movie/domain/usecases/get_trending_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_constants.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MockMovieRepository repository;

  late GetTrendingMovies usecase;
  setUp(() {
    repository = MockMovieRepository();
    usecase = GetTrendingMovies(repository);
  });

  test(
    "should get a list of trending",
    () async {
      //arrange
      when(() => repository.getTrendingMovies())
          .thenAnswer((_) async => Right(tMovies));
      //act
      final result = await usecase(NoParams());
      //assert
      verify(() => repository.getTrendingMovies());
      expect(result, Right(tMovies));
      verifyNoMoreInteractions(repository);
    },
  );
}
