import 'package:dartz/dartz.dart';
import 'package:filmov/core/usecase/usecase.dart';
import 'package:filmov/features/movie/domain/repositories/movie_repository.dart';
import 'package:filmov/features/movie/domain/usecases/get_soon_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_constants.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MockMovieRepository repository;

  late GetSoonMovies usecase;
  setUp(() {
    repository = MockMovieRepository();
    usecase = GetSoonMovies(repository);
  });

  test(
    "should get a list of soon ",
    () async {
      //arrange
      when(() => repository.getSoonMovies())
          .thenAnswer((_) async => Right(tMovies));
      //act
      final result = await usecase(NoParams());
      //assert
      verify(() => repository.getSoonMovies());
      expect(result, Right(tMovies));
      verifyNoMoreInteractions(repository);
    },
  );
}
