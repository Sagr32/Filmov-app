import 'package:dartz/dartz.dart';
import 'package:filmov/features/Credits/domain/entities/person.dart';
import 'package:filmov/features/Credits/domain/repositories/credits_repository.dart';
import 'package:filmov/features/Credits/domain/usecases/get_person_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreditRepository extends Mock implements CreditRepository {}

void main() {
  late MockCreditRepository repository;
  late GetPersonDetails useCase;
  final tPersonId = '6674';

  setUp(() {
    repository = MockCreditRepository();
    useCase = GetPersonDetails(repository);
  });

  final tPerson = Person(
    adult: false,
    alsoKnownAs: ["Ryan Rodney Reynolds"],
    biography: "biography",
    birthday: "1976-10-23",
    deathday: "null",
    gender: 2,
    homepage: "nll",
    id: 15,
    imdbId: "6059",
    knownForDepartment: "Acting",
    name: "Ryan Reynolds",
    placeOfBirth: "Canada",
    popularity: 156.2,
    profilePath: "profilePath",
  );
  test(
    "should get Person details ",
    () async {
      //arrange
      when(() => repository.getPersonDetails(personId: tPersonId))
          .thenAnswer((_) async => Right(tPerson));
      //act
      final result = await useCase(Params(tPersonId));
      //assert
      verify(() => repository.getPersonDetails(personId: tPersonId));
      expect(result, Right(tPerson));
      verifyNoMoreInteractions(repository);
    },
  );
}
