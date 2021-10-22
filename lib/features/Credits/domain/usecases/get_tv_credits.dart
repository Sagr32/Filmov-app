import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/credit.dart';
import '../repositories/credits_repository.dart';

class GetTvCredit implements UseCase<Credit, Params> {
  final CreditRepository creditRepository;

  GetTvCredit(this.creditRepository);

  @override
  Future<Either<Failure, Credit>> call(Params params) async {
    return await creditRepository.getTvCredits(tvShowId: params.tvShowId);
  }
}

class Params extends Equatable {
  final tvShowId;
  Params(this.tvShowId);

  @override
  List<Object?> get props => <Object>[tvShowId];
}
