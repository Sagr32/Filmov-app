import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

/// Get Recommendation Movies use case
class GetRecommendationMovies implements UseCase<List<Movie>, Params> {
  /// Constructor
  GetRecommendationMovies(this.movieRepository);

  /// Movie Repository
  final MovieRepository movieRepository;

  @override
  Future<Either<Failure, List<Movie>>> call(Params params) async {
    return await movieRepository.getRecommendationMovies(
      movieId: params.movieId,
    );
  }
}

/// Custom Parameter for use case
class Params extends Equatable {
  /// Constructor
  const Params(this.movieId);

  /// target movie id
  final String movieId;

  @override
  List<Object?> get props => <Object>[movieId];
}
