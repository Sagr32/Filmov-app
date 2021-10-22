import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

/// abstract usecase class
/// that take params and return [Type]
abstract class UseCase<Type, Params> {
  /// call usecase
  Future<Either<Failure, Type>> call(Params params);
}

/// passs no parameter to usecase class
class NoParams extends Equatable {
  @override
  List<Object?> get props => <Object>[];
}
