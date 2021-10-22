import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/features/movie/domain/usecases/search_movies.dart';
import 'package:filmov/features/movie/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_constants.dart';

class MockGetSearchMovies extends Mock implements SearchMovies {}

void main() {
  late MockGetSearchMovies mockGetSearchMovies;
  late SearchMoviesBloc bloc;

  final String tQuery = "Revenant";
  setUp(() {
    EquatableConfig.stringify = true;

    mockGetSearchMovies = MockGetSearchMovies();

    bloc = SearchMoviesBloc(searchUseCase: mockGetSearchMovies);
  });

  test('SearchInitialState should be Initial', () {
    // assert
    expect(
        bloc.state,
        equals(
          SearchMoviesInitial(),
        ));
  });

  group(
    "GetMoviesForSearch",
    () {
      test(
        'should get data from get Search use case',
        () async {
          // arrange
          when(() => mockGetSearchMovies(Params(tQuery)))
              .thenAnswer((_) async => Right(tMoviesModel));

          // act
          bloc.add(GetMoviesForSearch(query: tQuery));
          await untilCalled(() => mockGetSearchMovies(Params(tQuery)));
          // assert
          verify(() => mockGetSearchMovies(Params(tQuery)));
        },
      );

      blocTest<SearchMoviesBloc, SearchMoviesState>(
        'should emits [Loading, Loaded] when Search movies is loaded successfully',
        setUp: () {
          when(() => mockGetSearchMovies(Params(tQuery)))
              .thenAnswer((_) async => Right(tMoviesModel));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForSearch(query: tQuery)),
        expect: () => <SearchMoviesState>[
          SearchMoviesLoading(),
          SearchMoviesLoaded(movies: tMoviesModel),
        ],
        verify: (_) =>
            verify(() => mockGetSearchMovies(Params(tQuery))).called(1),
      );
      blocTest<SearchMoviesBloc, SearchMoviesState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetSearchMovies(Params(tQuery)))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMoviesForSearch(query: tQuery)),
        expect: () => <SearchMoviesState>[
          SearchMoviesLoading(),
          SearchMoviesError(message: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockGetSearchMovies(Params(tQuery))).called(1),
      );
    },
  );
}
