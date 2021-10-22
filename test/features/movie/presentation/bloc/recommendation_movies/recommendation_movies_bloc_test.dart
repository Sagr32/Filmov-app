import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/features/movie/domain/usecases/get_recommendation_movies.dart';
import 'package:filmov/features/movie/presentation/bloc/recommendation_movies/recommendation_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_constants.dart';

class MockGetRecommendationMovies extends Mock
    implements GetRecommendationMovies {}

void main() {
  late MockGetRecommendationMovies mockGetRecommendationMovies;
  late RecommendationMoviesBloc bloc;

  final String tMovieId = "123";
  setUp(() {
    EquatableConfig.stringify = true;

    mockGetRecommendationMovies = MockGetRecommendationMovies();

    bloc = RecommendationMoviesBloc(
        recommendationUseCase: mockGetRecommendationMovies);
  });

  test('RecommendationInitialState should be Initial', () {
    // assert
    expect(
        bloc.state,
        equals(
          RecommendationMoviesInitial(),
        ));
  });

  group(
    "GetMoviesForRecommendation",
    () {
      test(
        'should get data from get Recommendation use case',
        () async {
          // arrange
          when(() => mockGetRecommendationMovies(Params(tMovieId)))
              .thenAnswer((_) async => Right(tMoviesModel));

          // act
          bloc.add(GetMoviesForRecommendation(movieId: tMovieId));
          await untilCalled(
              () => mockGetRecommendationMovies(Params(tMovieId)));
          // assert
          verify(() => mockGetRecommendationMovies(Params(tMovieId)));
        },
      );

      blocTest<RecommendationMoviesBloc, RecommendationMoviesState>(
        'should emits [Loading, Loaded] when Recommendation movies is loaded successfully',
        setUp: () {
          when(() => mockGetRecommendationMovies(Params(tMovieId)))
              .thenAnswer((_) async => Right(tMoviesModel));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForRecommendation(movieId: tMovieId)),
        expect: () => <RecommendationMoviesState>[
          RecommendationMoviesLoading(),
          RecommendationMoviesLoaded(movies: tMoviesModel),
        ],
        verify: (_) =>
            verify(() => mockGetRecommendationMovies(Params(tMovieId)))
                .called(1),
      );
      blocTest<RecommendationMoviesBloc, RecommendationMoviesState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetRecommendationMovies(Params(tMovieId)))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForRecommendation(movieId: tMovieId)),
        expect: () => <RecommendationMoviesState>[
          RecommendationMoviesLoading(),
          RecommendationMoviesError(message: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockGetRecommendationMovies(Params(tMovieId)))
                .called(1),
      );
    },
  );
}
