import 'package:dartz/dartz.dart';
import 'package:filmov/features/movie/domain/repositories/movie_repository.dart';
import 'package:filmov/features/movie/domain/usecases/get_recommendation_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_constants.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MockMovieRepository repository;

  late GetRecommendationMovies usecase;
  final tMoviesId = '6674';
    setUp(() {
    repository = MockMovieRepository();
    usecase = GetRecommendationMovies(repository);
  });

  test(
    "should get a list of Recommendation ",
    () async {
      //arrange
      when(() => repository.getRecommendationMovies(movieId: tMoviesId))
          .thenAnswer((_) async => Right(tMovies));
      //act
      final result = await usecase(Params(tMoviesId));
      //assert
      verify(() => repository.getRecommendationMovies(movieId: tMoviesId));
      expect(result, Right(tMovies));
      verifyNoMoreInteractions(repository);
    },
  );
}
