import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_datasource.dart';

/// choose a function to call
typedef Future<List<Movie>> _MoviesChooser();

/// implementation of Movie Repository

class MovieRepositoryImpl implements MovieRepository {
  /// Constructor
  MovieRepositoryImpl({
    required this.movieRemoteDataSource,
  });

  /// movie remote data source
  final MovieRemoteDataSource movieRemoteDataSource;

  @override
  Future<Either<Failure, List<Movie>>> getSoonMovies() async {
    return await _getMovies(() {
      return movieRemoteDataSource.getSoonMovies();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async {
    return await _getMovies(() {
      return movieRemoteDataSource.getTrendingMovies();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(
      {required String query}) async {
    return await _getMovies(() {
      return movieRemoteDataSource.searchMovies(query: query);
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    return await _getMovies(() {
      return movieRemoteDataSource.getPopularMovies();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getRecommendationMovies(
      {required String movieId}) async {
    return await _getMovies(() {
      return movieRemoteDataSource.getRecommendationMovies(movieId: movieId);
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    return await _getMovies(() {
      return movieRemoteDataSource.getTopRatedMovies();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesForPerson(
      {required String personId}) async {
    return await _getMovies(() {
      return movieRemoteDataSource.getMoviesForPerson(personId: personId);
    });
  }

  Future<Either<Failure, List<Movie>>> _getMovies(
      _MoviesChooser chooserFunc) async {
    try {
      final List<Movie> remoteMovies = await chooserFunc();

      return Right(remoteMovies);
    } on Exception  {
      return Left(
        ServerFailure(
        ),
      );
    }
  }
}
