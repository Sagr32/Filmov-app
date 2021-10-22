import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/credit.dart';
import '../repositories/credits_repository.dart';

/// Movie Credit use case
class GetMovieCredit implements UseCase<Credit, Params> {
  /// Default Constructor
  GetMovieCredit(this.creditRepository);

  /// Credit Repository
  final CreditRepository creditRepository;

  @override
  Future<Either<Failure, Credit>> call(Params params) async {
    return await creditRepository.getMovieCredits(movieId: params.movieId);
  }
}

/// Custom parameter that passes to [Usecase]
class Params extends Equatable {

  /// Default Constructor
  const Params(this.movieId);
  /// movie id as a parameter
  final String movieId;

  @override
  List<Object?> get props => <Object>[movieId];
}
