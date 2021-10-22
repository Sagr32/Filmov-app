import 'package:dartz/dartz.dart';
import 'package:filmov/features/Credits/domain/entities/cast.dart';
import 'package:filmov/features/Credits/domain/entities/credit.dart';
import 'package:filmov/features/Credits/domain/entities/crew.dart';
import 'package:filmov/features/Credits/domain/repositories/credits_repository.dart';
import 'package:filmov/features/Credits/domain/usecases/get_movie_credits.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreditRepository extends Mock implements CreditRepository {}

void main() {
  late MockCreditRepository repository;
  late GetMovieCredit useCase;
  final tMovieId = '6674';

  setUp(() {
    repository = MockCreditRepository();
    useCase = GetMovieCredit(repository);
  });

  final tCredit = Credit(
    id: 1,
    cast: <Cast>[
      Cast(
          adult: false,
          gender: 1,
          id: 1,
          knownForDepartment: "Ellie",
          name: "Ellie Kemper",
          originalName: "Ellie Kemper",
          popularity: 1.5,
          profilePath: "profilePath",
          castId: 6,
          character: "character",
          creditId: "22",
          order: 1),
    ],
    crew: <Crew>[
      Crew(
        adult: false,
        gender: 1,
        id: 1,
        knownForDepartment: "Jake Johnson",
        name: "Jake Johnson",
        originalName: "Jake Johnson",
        popularity: 1.5,
        profilePath: "profilePath",
        creditId: "creditId",
        department: "department",
        job: "job",
      )
    ],
  );

  test(
    "should get Movie Credit ",
    () async {
      //arrange
      when(() => repository.getMovieCredits(movieId: tMovieId))
          .thenAnswer((_) async => Right(tCredit));
      //act
      final result = await useCase(Params(tMovieId));
      //assert
      verify(() => repository.getMovieCredits(movieId: tMovieId));
      expect(result, Right(tCredit));
      verifyNoMoreInteractions(repository);
    },
  );
}
