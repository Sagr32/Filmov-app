import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

/// Top Rated Movies use case
class GetTopRatedMovies implements UseCase<List<Movie>, NoParams> {
  final MovieRepository movieRepository;

  GetTopRatedMovies(this.movieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await movieRepository.getTopRatedMovies();
  }
}
