import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/credit.dart';
import '../entities/person.dart';

/// Credit Repository
abstract class CreditRepository {
  Future<Either<Failure, Credit>> getMovieCredits({required String movieId});
  Future<Either<Failure, Credit>> getTvCredits({required String tvShowId});
  Future<Either<Failure, Person>> getPersonDetails({required String personId});
}
