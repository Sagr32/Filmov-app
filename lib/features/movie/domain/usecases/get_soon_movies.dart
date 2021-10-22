import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

/// Get soon movies use case
class GetSoonMovies implements UseCase<List<Movie>, NoParams> {
  /// Constructor
  GetSoonMovies(this.movieRepository);

  /// Movie Repository
  final MovieRepository movieRepository;

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await movieRepository.getSoonMovies();
  }
}
