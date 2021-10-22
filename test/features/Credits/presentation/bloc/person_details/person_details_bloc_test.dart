import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/features/Credits/domain/entities/person.dart';
import 'package:filmov/features/Credits/domain/usecases/get_person_details.dart';
import 'package:filmov/features/Credits/presentation/bloc/person_details/person_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_constants.dart';

class MockGetPersonDetails extends Mock implements GetPersonDetails {}

void main() {
  late MockGetPersonDetails mockGetPersonDetails;
  late PersonDetailsBloc bloc;
  final tPersonId = '123';

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
  setUp(() {
    EquatableConfig.stringify = true;

    mockGetPersonDetails = MockGetPersonDetails();

    bloc = PersonDetailsBloc(personDetailsUseCase: mockGetPersonDetails);
  });

  test('PersonDetailsInitialState should be Initial', () {
    // assert
    expect(
        bloc.state,
        equals(
          PersonDetailsInitial(),
        ));
  });

  group(
    "getPersonDetails bloc",
    () {
      test(
        'should get data from get Person Details use case',
        () async {
          // arrange
          when(() => mockGetPersonDetails(Params(tPersonId)))
              .thenAnswer((_) async => Right(tPerson));

          // act
          bloc.add(GetPersonDetailsEvent(personId: tPersonId));
          await untilCalled(() => mockGetPersonDetails(Params(tPersonId)));
          // assert
          verify(() => mockGetPersonDetails(Params(tPersonId)));
        },
      );

      blocTest<PersonDetailsBloc, PersonDetailsState>(
        'should emits [Loading, Loaded] when Movie Credit is loaded successfully',
        setUp: () {
          when(() => mockGetPersonDetails(Params(tPersonId)))
              .thenAnswer((_) async => Right(tPerson));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetPersonDetailsEvent(personId: tPersonId)),
        expect: () => <PersonDetailsState>[
          PersonDetailsLoading(),
          PersonDetailsLoaded(person: tPerson),
        ],
        verify: (_) =>
            verify(() => mockGetPersonDetails(Params(tPersonId))).called(1),
      );
      blocTest<PersonDetailsBloc, PersonDetailsState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetPersonDetails(Params(tPersonId)))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetPersonDetailsEvent(personId: tPersonId)),
        expect: () => <PersonDetailsState>[
          PersonDetailsLoading(),
          PersonDetailsError(message: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockGetPersonDetails(Params(tPersonId))).called(1),
      );
    },
  );
}
