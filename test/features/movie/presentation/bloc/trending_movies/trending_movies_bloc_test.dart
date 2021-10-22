import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/core/usecase/usecase.dart';

import 'package:filmov/features/movie/domain/usecases/get_trending_movies.dart';
import 'package:filmov/features/movie/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_constants.dart';

class MockGetTrendingMovies extends Mock implements GetTrendingMovies {}

void main() {
  late MockGetTrendingMovies mockGetTrendingMovies;
  late TrendingMoviesBloc bloc;
  setUp(() {
    EquatableConfig.stringify = true;

    mockGetTrendingMovies = MockGetTrendingMovies();

    bloc = TrendingMoviesBloc(trendingUseCase: mockGetTrendingMovies);
  });

  test('TrendingInitialState should be Initial', () {
    // assert
    expect(
        bloc.state,
        equals(
          TrendingMoviesInitial(),
        ));
  });

  group(
    "GetMoviesForTrending",
    () {
      test(
        'should get data from get trending use case',
        () async {
          // arrange
          when(() => mockGetTrendingMovies(NoParams()))
              .thenAnswer((_) async => Right(tMoviesModel));

          // act
          bloc.add(GetMoviesForTrending());
          await untilCalled(() => mockGetTrendingMovies(NoParams()));
          // assert
          verify(() => mockGetTrendingMovies(NoParams()));
        },
      );

      blocTest<TrendingMoviesBloc, TrendingMoviesState>(
        'should emits [Loading, Loaded] when trending movies is loaded successfully',
        setUp: () {
          when(() => mockGetTrendingMovies(NoParams()))
              .thenAnswer((_) async => Right(tMoviesModel));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForTrending()),
        expect: () => <TrendingMoviesState>[
          TrendingMoviesLoading(),
          TrendingMoviesLoaded(movies: tMoviesModel),
        ],
        verify: (_) =>
            verify(() => mockGetTrendingMovies(NoParams())).called(1),
      );
      blocTest<TrendingMoviesBloc, TrendingMoviesState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetTrendingMovies(NoParams()))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForTrending()),
        expect: () => <TrendingMoviesState>[
          TrendingMoviesLoading(),
          TrendingMoviesError(message: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockGetTrendingMovies(NoParams())).called(1),
      );
    },
  );
}
