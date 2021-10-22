import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/core/usecase/usecase.dart';
import 'package:filmov/features/movie/domain/usecases/get_top_rated_movies.dart';
import 'package:filmov/features/movie/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_constants.dart';

class MockGetTopRatedMovies extends Mock implements GetTopRatedMovies {}

void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late TopRatedMoviesBloc bloc;
  setUp(() {
    EquatableConfig.stringify = true;

    mockGetTopRatedMovies = MockGetTopRatedMovies();

    bloc = TopRatedMoviesBloc(topRatedUseCase: mockGetTopRatedMovies);
  });

  test('TopRatedInitialState should be Initial', () {
    // assert
    expect(
        bloc.state,
        equals(
          TopRatedMoviesInitial(),
        ));
  });

  group(
    "GetMoviesForTopRated",
    () {
      test(
        'should get data from get TopRated use case',
        () async {
          // arrange
          when(() => mockGetTopRatedMovies(NoParams()))
              .thenAnswer((_) async => Right(tMoviesModel));

          // act
          bloc.add(GetMoviesForTopRated());
          await untilCalled(() => mockGetTopRatedMovies(NoParams()));
          // assert
          verify(() => mockGetTopRatedMovies(NoParams()));
        },
      );

      blocTest<TopRatedMoviesBloc, TopRatedMoviesState>(
        'should emits [Loading, Loaded] when TopRated movies is loaded successfully',
        setUp: () {
          when(() => mockGetTopRatedMovies(NoParams()))
              .thenAnswer((_) async => Right(tMoviesModel));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForTopRated()),
        expect: () => <TopRatedMoviesState>[
          TopRatedMoviesLoading(),
          TopRatedMoviesLoaded(movies: tMoviesModel),
        ],
        verify: (_) =>
            verify(() => mockGetTopRatedMovies(NoParams())).called(1),
      );
      blocTest<TopRatedMoviesBloc, TopRatedMoviesState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetTopRatedMovies(NoParams()))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForTopRated()),
        expect: () => <TopRatedMoviesState>[
          TopRatedMoviesLoading(),
          TopRatedMoviesError(message: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockGetTopRatedMovies(NoParams())).called(1),
      );
    },
  );
}
