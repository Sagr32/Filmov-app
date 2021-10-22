import 'package:dartz/dartz.dart';
import 'package:filmov/core/error/exceptions.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/features/movie/data/datasources/movie_remote_datasource.dart';
import 'package:filmov/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_constants.dart';

class MockMovieRemoteDataSource extends Mock implements MovieRemoteDataSource {}

void main() {
  late MockMovieRemoteDataSource mockMovieRemoteDataSource;
  late MovieRepositoryImpl repositoryImpl;
  final String tQuery = 'Revenant';
  final String tMovieId = '6674';
  final String tPersonId = '123';
  

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();

    repositoryImpl = MovieRepositoryImpl(
      movieRemoteDataSource: mockMovieRemoteDataSource,
    );
  });

  group(
    'GetTrendingMovies ',
    () {
      test(
        'Should return trending movies when calling remote data source is succesful ',
        () async {
          //
          when(() => mockMovieRemoteDataSource.getTrendingMovies())
              .thenAnswer((_) async => (tMoviesModel));
//
          final result = await repositoryImpl.getTrendingMovies();
          //
          expect(result, Right(tMoviesModel));
        },
      );

      test(
        'Should return ServerException when calling remote data source failed',
        () async {
          when(() => mockMovieRemoteDataSource.getTrendingMovies())
              .thenThrow(ServerException());

          final result = await repositoryImpl.getTrendingMovies();
          expect(result, Left(ServerFailure()));
        },
      );
    },
  );

  group(
    'GetSoonMovies ',
    () {
      test(
        'Should return soon movies when calling remote data source is succesful ',
        () async {
          when(() => mockMovieRemoteDataSource.getSoonMovies())
              .thenAnswer((_) async => (tMoviesModel));

          final result = await repositoryImpl.getSoonMovies();
          expect(result, Right(tMoviesModel));
        },
      );
      test(
        'Should return Server Exception  when calling remote data source failed',
        () async {
          when(() => mockMovieRemoteDataSource.getSoonMovies())
              .thenThrow(ServerException());

          final result = await repositoryImpl.getSoonMovies();
          expect(result, Left(ServerFailure()));
        },
      );
    },
  );

  group(
    'SearchMovies ',
    () {
      test(
        'Should return movies when calling remote data source for searching is succesful',
        () async {
          when(() => mockMovieRemoteDataSource.searchMovies(query: tQuery))
              .thenAnswer((_) async => (tMoviesModel));

          final result = await repositoryImpl.searchMovies(query: tQuery);
          expect(result, Right(tMoviesModel));
        },
      );
      test(
        'Should return Server Exception  when calling remote data source failed',
        () async {
          when(() => mockMovieRemoteDataSource.searchMovies(query: tQuery))
              .thenThrow(ServerException());

          final result = await repositoryImpl.searchMovies(query: tQuery);
          expect(result, Left(ServerFailure()));
        },
      );
    },
  );

  group(
    'PopularMovies ',
    () {
      test(
        'Should return movies when calling remote data source for popular movies is succesful ',
        () async {
          when(() => mockMovieRemoteDataSource.getPopularMovies())
              .thenAnswer((_) async => (tMoviesModel));

          final result = await repositoryImpl.getPopularMovies();
          expect(result, Right(tMoviesModel));
        },
      );
      test(
        'Should return Server Exception  when calling remote data source failed',
        () async {
          when(() => mockMovieRemoteDataSource.getPopularMovies())
              .thenThrow(ServerException());

          final result = await repositoryImpl.getPopularMovies();
          expect(result, Left(ServerFailure()));
        },
      );
    },
  );

  group(
    'GetMoviesForPerson ',
    () {
      test(
        'Should return movies when calling remote data source is succesful ',
        () async {
          when(() => mockMovieRemoteDataSource.getMoviesForPerson(
              personId: tPersonId)).thenAnswer((_) async => (tMoviesModel));

          final result =
              await repositoryImpl.getMoviesForPerson(personId: tPersonId);
          expect(result, Right(tMoviesModel));
        },
      );
      test(
        'Should return Server Exception  when calling remote data source failed',
        () async {
          when(() => mockMovieRemoteDataSource.getMoviesForPerson(
              personId: tPersonId)).thenThrow(ServerException());

          final result =
              await repositoryImpl.getMoviesForPerson(personId: tPersonId);
          expect(result, Left(ServerFailure()));
        },
      );
    },
  );

  group(
    'getRecommendation ',
    () {
      test(
        'Should return movies when calling remote data source is succesful ',
        () async {
          when(() => mockMovieRemoteDataSource.getRecommendationMovies(
              movieId: tMovieId)).thenAnswer((_) async => (tMoviesModel));

          final result =
              await repositoryImpl.getRecommendationMovies(movieId: tMovieId);
          expect(result, Right(tMoviesModel));
        },
      );
      test(
        'Should return Server Exception  when calling remote data source for failed',
        () async {
          when(() => mockMovieRemoteDataSource.getRecommendationMovies(
              movieId: tMovieId)).thenThrow(ServerException());

          final result =
              await repositoryImpl.getRecommendationMovies(movieId: tMovieId);
          expect(result, Left(ServerFailure()));
        },
      );
    },
  );

  group(
    'GetTopRatedMovies ',
    () {
      test(
        'Should return movies when calling remote data source is succesful ',
        () async {
          when(() => mockMovieRemoteDataSource.getTopRatedMovies())
              .thenAnswer((_) async => (tMoviesModel));

          final result = await repositoryImpl.getTopRatedMovies();
          expect(result, Right(tMoviesModel));
        },
      );
      test(
        'Should return Server Exception  when calling remote data source failed',
        () async {
          when(() => mockMovieRemoteDataSource.getTopRatedMovies())
              .thenThrow(ServerException());

          final result = await repositoryImpl.getTopRatedMovies();
          expect(result, Left(ServerFailure()));
        },
      );
    },
  );
}
