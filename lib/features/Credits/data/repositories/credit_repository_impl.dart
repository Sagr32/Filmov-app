import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/credit.dart';
import '../../domain/entities/person.dart';
import '../../domain/repositories/credits_repository.dart';
import '../datasources/credit_remote_data_source.dart';

/// choose a function and calls it , that return
/// Future of Credit
typedef Future<Credit> _CreditChooser();

/// Credit Repository Implementaion
class CreditRepositoryImpl implements CreditRepository {
  /// Default Constructor
  CreditRepositoryImpl({required this.creditRemoteDataSource});

  /// Credit Remote Data Source
  final CreditRemoteDataSource creditRemoteDataSource;

  @override
  Future<Either<Failure, Credit>> getMovieCredits(
      {required String movieId}) async {
    return await _getCredit(() {
      return creditRemoteDataSource.getMovieCredit(movieId: movieId);
    });
  }

  @override
  Future<Either<Failure, Credit>> getTvCredits(
      {required String tvShowId}) async {
    return await _getCredit(() {
      return creditRemoteDataSource.getTvCredit(tvShowId: tvShowId);
    });
  }

  @override
  Future<Either<Failure, Person>> getPersonDetails(
      {required String personId}) async {
    try {
      final remotePerson =
          await creditRemoteDataSource.getPersonDetails(personId: personId);

      return Right(remotePerson);
    } on Exception  {
      return Left(
        ServerFailure(),
      );
    }
  }

  Future<Either<Failure, Credit>> _getCredit(_CreditChooser chooserFunc) async {
    try {
      final remoteCredit = await chooserFunc();

      return Right(remoteCredit);
    } on Exception {
      return Left(
        ServerFailure(),
      );
    }
  }
}
