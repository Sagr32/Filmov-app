import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';

/// Movie repository or contract
abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> getSoonMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getRecommendationMovies(
      {required String movieId});

  Future<Either<Failure, List<Movie>>> getMoviesForPerson(
      {required String personId});
  Future<Either<Failure, List<Movie>>> searchMovies({required String query});
}
