import 'package:dartz/dartz.dart';
import 'package:filmov/features/Credits/domain/entities/cast.dart';
import 'package:filmov/features/Credits/domain/entities/credit.dart';
import 'package:filmov/features/Credits/domain/entities/crew.dart';
import 'package:filmov/features/Credits/domain/repositories/credits_repository.dart';
import 'package:filmov/features/Credits/domain/usecases/get_tv_credits.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreditRepository extends Mock implements CreditRepository {}

void main() {
  late MockCreditRepository repository;
  late GetTvCredit useCase;
  final tTvShowId = '123';

  setUp(() {
    repository = MockCreditRepository();
    useCase = GetTvCredit(repository);
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
          order: 1)
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
    "should get tv Credit ",
    () async {
      //arrange
      when(() => repository.getTvCredits(tvShowId: tTvShowId))
          .thenAnswer((_) async => Right(tCredit));
      //act
      final result = await useCase(Params(tTvShowId));
      //assert
      verify(() => repository.getTvCredits(tvShowId: tTvShowId));
      expect(result, Right(tCredit));
      verifyNoMoreInteractions(repository);
    },
  );
}
