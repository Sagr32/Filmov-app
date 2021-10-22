import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/person.dart';
import '../repositories/credits_repository.dart';

/// Person Details Use case
class GetPersonDetails implements UseCase<Person, Params> {
  /// Default Constructor
  GetPersonDetails(this.creditRepository);

  /// Credit Repository
  final CreditRepository creditRepository;

  @override
  Future<Either<Failure, Person>> call(Params params) async {
    return await creditRepository.getPersonDetails(personId: params.personId);
  }
}

/// Custom Params that passes to Usecase
class Params extends Equatable {
  /// Default Constructor
  Params(this.personId);

  /// person id as a parameter
  final String personId;

  @override
  List<Object?> get props => <Object>[personId];
}
