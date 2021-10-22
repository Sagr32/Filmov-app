import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

/// Search Movies use case
/// [Not Implemented yet]
class SearchMovies implements UseCase<List<Movie>, Params> {
  /// Constructor
  SearchMovies(this.movieRepository);

  /// Movie Repository
  final MovieRepository movieRepository;

  @override
  Future<Either<Failure, List<Movie>>> call(Params params) async {
    return await movieRepository.searchMovies(query: params.query);
  }
}

/// Custom parameter for use case
class Params extends Equatable {
  /// constructor
  const Params(this.query);

  /// query that used for search
  final String query;

  @override
  List<Object?> get props => <Object>[query];
}
