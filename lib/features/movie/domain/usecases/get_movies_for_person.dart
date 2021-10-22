import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

/// get movies for a specifec person use case
class GetMoviesForPerson implements UseCase<List<Movie>, Params> {
  /// Constructor
  GetMoviesForPerson(this.movieRepository);

  /// Movie Repository
  final MovieRepository movieRepository;

  @override
  Future<Either<Failure, List<Movie>>> call(Params params) async {
    return await movieRepository.getMoviesForPerson(personId: params.personId);
  }
}

/// Custom parameter to pass in use case
class Params extends Equatable {
  /// constructor
  const Params(this.personId);

  /// target person id
  final String personId;

  @override
  List<Object?> get props => <Object>[personId];
}
