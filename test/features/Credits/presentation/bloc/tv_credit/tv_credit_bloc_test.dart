import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/features/Credits/domain/entities/cast.dart';
import 'package:filmov/features/Credits/domain/entities/credit.dart';
import 'package:filmov/features/Credits/domain/entities/crew.dart';
import 'package:filmov/features/Credits/domain/usecases/get_tv_credits.dart';
import 'package:filmov/features/Credits/presentation/bloc/tv_credit/tv_credit_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_constants.dart';

class MockGetTvCredit extends Mock implements GetTvCredit {}

void main() {
  late MockGetTvCredit mockGetTvCredit;
  late TvCreditBloc bloc;
  final tTvShowId = '6674';
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

    mockGetTvCredit = MockGetTvCredit();

    bloc = TvCreditBloc(tvCreditUseCase: mockGetTvCredit);
  });

  test('TvCreditInitialState should be Initial', () {
    // assert
    expect(
        bloc.state,
        equals(
          TvCreditInitial(),
        ));
  });

  group(
    "getTvCredit bloc",
    () {
      test(
        'should get data from get Tv Credit use case',
        () async {
          // arrange
          when(() => mockGetTvCredit(Params(tTvShowId)))
              .thenAnswer((_) async => Right(tCredit));

          // act
          bloc.add(GetTvCreditEvent(tvShowId: tTvShowId));
          await untilCalled(() => mockGetTvCredit(Params(tTvShowId)));
          // assert
          verify(() => mockGetTvCredit(Params(tTvShowId)));
        },
      );

      blocTest<TvCreditBloc, TvCreditState>(
        'should emits [Loading, Loaded] when Tv Credit is loaded successfully',
        setUp: () {
          when(() => mockGetTvCredit(Params(tTvShowId)))
              .thenAnswer((_) async => Right(tCredit));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetTvCreditEvent(tvShowId: tTvShowId)),
        expect: () => <TvCreditState>[
          TvCreditLoading(),
          TvCreditLoaded(credit: tCredit),
        ],
        verify: (_) =>
            verify(() => mockGetTvCredit(Params(tTvShowId))).called(1),
      );
      blocTest<TvCreditBloc, TvCreditState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetTvCredit(Params(tTvShowId)))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetTvCreditEvent(tvShowId: tTvShowId)),
        expect: () => <TvCreditState>[
          TvCreditLoading(),
          TvCreditError(message: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockGetTvCredit(Params(tTvShowId))).called(1),
      );
    },
  );
}
