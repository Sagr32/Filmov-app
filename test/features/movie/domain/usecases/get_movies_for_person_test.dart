import 'package:dartz/dartz.dart';
import 'package:filmov/features/movie/domain/repositories/movie_repository.dart';
import 'package:filmov/features/movie/domain/usecases/get_movies_for_person.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_constants.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MockMovieRepository repository;

  late GetMoviesForPerson usecase;
  final tPersonId = '123';
  
  setUp(() {
    repository = MockMovieRepository();
    usecase = GetMoviesForPerson(repository);
  });

  test(
    "should get a list of soon ",
    () async {
      //arrange
      when(() => repository.getMoviesForPerson(personId: tPersonId))
          .thenAnswer((_) async => Right(tMovies));
      //act
      final result = await usecase(Params(tPersonId));
      //assert
      verify(() => repository.getMoviesForPerson(personId: tPersonId));
      expect(result, Right(tMovies));
      verifyNoMoreInteractions(repository);
    },
  );
}
