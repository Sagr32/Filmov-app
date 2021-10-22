// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:filmov/core/error/failure.dart';
// import 'package:filmov/core/usecase/usecase.dart';
// import 'package:filmov/features/movie/domain/entities/movie.dart';
// import 'package:filmov/features/movie/domain/usecases/get_popular_movies.dart';
// import 'package:filmov/features/movie/presentation/bloc/popular_movies/popular_movies_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class MockGetPopularMovies extends Mock implements GetPopularMovies {}

// void main() {
//   late MockGetPopularMovies mockGetPopularMovies;
//   late PopularMoviesBloc bloc;

//   List<Movie> tMoviesModel = [
//     Movie(
//         adult: false,
//         backdropPath: "backdrop path test",
//         id: 436969,
//         originalLanguage: "en",
//         overview: "The Suicide Squad overview",
//         popularity: 1723.518,
//         posterPath: "poster path test",
//         releaseDate: "2021-07-28",
//         title: "The Suicide Squad",
//         voteAverage: 7.8,
//         voteCount: 4205),
//     Movie(
//         adult: false,
//         backdropPath: "backdrop path test",
//         id: 436969,
//         originalLanguage: "en",
//         overview: "The Suicide Squad overview",
//         popularity: 1723.518,
//         posterPath: "poster path test",
//         releaseDate: "2021-07-28",
//         title: "The Suicide Squad",
//         voteAverage: 7.8,
//         voteCount: 4205),
//   ];
//   setUp(() {
//     EquatableConfig.stringify = true;

//     mockGetPopularMovies = MockGetPopularMovies();

//     bloc = PopularMoviesBloc(popularUseCase: mockGetPopularMovies);
//   });

//   test('PopularInitialState should be Initial', () {
//     // assert
//     expect(
//         bloc.state,
//         equals(
//           PopularMoviesInitial(),
//         ));
//   });

//   group(
//     "GetMoviesForPopular",
//     () {
//       test(
//         'should get data from get Popular use case',
//         () async {
//           // arrange
//           when(() => mockGetPopularMovies(NoParams()))
//               .thenAnswer((_) async => Right(tMoviesModel));

//           // act
//           bloc.add(GetMoviesForPopular());
//           await untilCalled(() => mockGetPopularMovies(NoParams()));
//           // assert
//           verify(() => mockGetPopularMovies(NoParams()));
//         },
//       );

//       blocTest<PopularMoviesBloc, PopularMoviesState>(
//         'should emits [Loading, Loaded] when Popular movies is loaded successfully',
//         setUp: () {
//           when(() => mockGetPopularMovies(NoParams()))
//               .thenAnswer((_) async => Right(tMoviesModel));
//         },
//         build: () => bloc,
//         act: (bloc) => bloc.add(GetMoviesForPopular()),
//         expect: () => <PopularMoviesState>[
//           // PopularMoviesLoading(),
//           Loading(),
//           // PopularMoviesLoaded(movies: tMoviesModel),
//           Loaded(movies: tMoviesModel),
//         ],
//         verify: (_) => verify(() => mockGetPopularMovies(NoParams())).called(1),
//       );
//       blocTest<PopularMoviesBloc, PopularMoviesState>(
//         'should emits [Loading, Error] when error occurs',
//         setUp: () {
//           when(() => mockGetPopularMovies(NoParams()))
//               .thenAnswer((_) async => Left(ServerFailure()));
//         },
//         build: () => bloc,
//         act: (bloc) => bloc.add(GetMoviesForPopular()),
//         expect: () => <PopularMoviesState>[
//           // PopularMoviesLoading(),
//           Loading(),
//           // PopularMoviesError(message:kErrorMessage),
//           Error(message:kErrorMessage),
//         ],
//         verify: (_) => verify(() => mockGetPopularMovies(NoParams())).called(1),
//       );
//     },
//   );
// }
