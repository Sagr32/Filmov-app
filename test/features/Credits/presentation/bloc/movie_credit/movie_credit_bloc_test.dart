import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/features/Credits/domain/entities/cast.dart';
import 'package:filmov/features/Credits/domain/entities/credit.dart';
import 'package:filmov/features/Credits/domain/entities/crew.dart';
import 'package:filmov/features/Credits/domain/usecases/get_movie_credits.dart';
import 'package:filmov/features/Credits/presentation/bloc/movie_credit/movie_credit_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../test_constants.dart';

class MockGetMovieCredit extends Mock implements GetMovieCredit {}

void main() {
  late MockGetMovieCredit mockGetMovieCredit;
  late MovieCreditBloc bloc;
  final tMovieId = '6674';
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

  setUp(() {
    EquatableConfig.stringify = true;

    mockGetMovieCredit = MockGetMovieCredit();

    bloc = MovieCreditBloc(movieCreditUseCase: mockGetMovieCredit);
  });

  test('MovieCreditInitialState should be Initial', () {
    // assert
    expect(
        bloc.state,
        equals(
          MovieCreditInitial(),
        ));
  });

  group(
    "getMovieCredit bloc",
    () {
      test(
        'should get data from get Movie Credit use case',
        () async {
          // arrange
          when(() => mockGetMovieCredit(Params(tMovieId)))
              .thenAnswer((_) async => Right(tCredit));

          // act
          bloc.add(GetMovieCreditEvent(movieId: tMovieId));
          await untilCalled(() => mockGetMovieCredit(Params(tMovieId)));
          // assert
          verify(() => mockGetMovieCredit(Params(tMovieId)));
        },
      );

      blocTest<MovieCreditBloc, MovieCreditState>(
        'should emits [Loading, Loaded] when Movie Credit is loaded successfully',
        setUp: () {
          when(() => mockGetMovieCredit(Params(tMovieId)))
              .thenAnswer((_) async => Right(tCredit));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMovieCreditEvent(movieId: tMovieId)),
        expect: () => <MovieCreditState>[
          MovieCreditLoading(),
          MovieCreditLoaded(credit: tCredit),
        ],
        verify: (_) =>
            verify(() => mockGetMovieCredit(Params(tMovieId))).called(1),
      );
      blocTest<MovieCreditBloc, MovieCreditState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetMovieCredit(Params(tMovieId)))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMovieCreditEvent(movieId: tMovieId)),
        expect: () => <MovieCreditState>[
          MovieCreditLoading(),
          MovieCreditError(message: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockGetMovieCredit(Params(tMovieId))).called(1),
      );
    },
  );
}
