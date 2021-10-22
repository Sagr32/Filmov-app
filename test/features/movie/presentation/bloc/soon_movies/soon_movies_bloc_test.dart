import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/core/usecase/usecase.dart';
import 'package:filmov/features/movie/domain/usecases/get_soon_movies.dart';
import 'package:filmov/features/movie/presentation/bloc/soon_movies/soon_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_constants.dart';

class MockGetSoonMovies extends Mock implements GetSoonMovies {}

void main() {
  late MockGetSoonMovies mockGetSoonMovies;
  late SoonMoviesBloc bloc;
  setUp(() {
    EquatableConfig.stringify = true;

    mockGetSoonMovies = MockGetSoonMovies();

    bloc = SoonMoviesBloc(soonUseCase: mockGetSoonMovies);
  });

  test('SoonInitialState should be Initial', () {
    // assert
    expect(
        bloc.state,
        equals(
          SoonMoviesInitial(),
        ));
  });

  group(
    "GetMoviesForSoon",
    () {
      test(
        'should get data from get Soon use case',
        () async {
          // arrange
          when(() => mockGetSoonMovies(NoParams()))
              .thenAnswer((_) async => Right(tMoviesModel));

          // act
          bloc.add(GetMoviesForSoon());
          await untilCalled(() => mockGetSoonMovies(NoParams()));
          // assert
          verify(() => mockGetSoonMovies(NoParams()));
        },
      );

      blocTest<SoonMoviesBloc, SoonMoviesState>(
        'should emits [Loading, Loaded] when Soon movies is loaded successfully',
        setUp: () {
          when(() => mockGetSoonMovies(NoParams()))
              .thenAnswer((_) async => Right(tMoviesModel));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForSoon()),
        expect: () => <SoonMoviesState>[
          SoonMoviesLoading(),
          SoonMoviesLoaded(movies: tMoviesModel),
        ],
        verify: (_) => verify(() => mockGetSoonMovies(NoParams())).called(1),
      );
      blocTest<SoonMoviesBloc, SoonMoviesState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetSoonMovies(NoParams()))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForSoon()),
        expect: () => <SoonMoviesState>[
          SoonMoviesLoading(),
          SoonMoviesError(message: kErrorMessage),
        ],
        verify: (_) => verify(() => mockGetSoonMovies(NoParams())).called(1),
      );
    },
  );
}
