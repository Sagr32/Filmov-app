import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/features/movie/domain/usecases/get_movies_for_person.dart';
import 'package:filmov/features/movie/presentation/bloc/movies_for_person/movies_for_person_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_constants.dart';

class MockGetMoviesForPerson extends Mock implements GetMoviesForPerson {}

void main() {
  late MockGetMoviesForPerson mockGetMoviesForPerson;
  late MoviesForPersonBloc bloc;
  final tPersonId = "123";
  setUp(() {
    EquatableConfig.stringify = true;

    mockGetMoviesForPerson = MockGetMoviesForPerson();

    bloc = MoviesForPersonBloc(moviesForPersonUseCase: mockGetMoviesForPerson);
  });

  test('PopularInitialState should be Initial', () {
    // assert
    expect(
        bloc.state,
        equals(
          MoviesForPersonInitial(),
        ));
  });

  group(
    "GetMoviesForPopular",
    () {
      test(
        'should get data from get Popular use case',
        () async {
          // arrange
          when(() => mockGetMoviesForPerson(Params(tPersonId)))
              .thenAnswer((_) async => Right(tMoviesModel));

          // act
          bloc.add(GetMoviesForPersonEvent(personId: tPersonId));
          await untilCalled(() => mockGetMoviesForPerson(Params(tPersonId)));
          // assert
          verify(() => mockGetMoviesForPerson(Params(tPersonId)));
        },
      );

      blocTest<MoviesForPersonBloc, MoviesForPersonState>(
        'should emits [Loading, Loaded] when Popular movies is loaded successfully',
        setUp: () {
          when(() => mockGetMoviesForPerson(Params(tPersonId)))
              .thenAnswer((_) async => Right(tMoviesModel));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForPersonEvent(personId: tPersonId)),
        expect: () => <MoviesForPersonState>[
          MoviesForPersonLoading(),
          MoviesForPersonLoaded(movies: tMoviesModel),
        ],
        verify: (_) =>
            verify(() => mockGetMoviesForPerson(Params(tPersonId))).called(1),
      );
      blocTest<MoviesForPersonBloc, MoviesForPersonState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetMoviesForPerson(Params(tPersonId)))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForPersonEvent(personId: tPersonId)),
        expect: () => <MoviesForPersonState>[
          MoviesForPersonLoading(),
          MoviesForPersonError(message: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockGetMoviesForPerson(Params(tPersonId))).called(1),
      );
    },
  );
}
