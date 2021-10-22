import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/tv.dart';
import '../repositories/tv_repository.dart';

class GetRecommendationTv implements UseCase<List<Tv>, Params> {
  final TvRepository tvRepository;

  GetRecommendationTv(this.tvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(Params params) async {
    return await tvRepository.getRecommendationTv(tvShowId: params.tvShowId);
  }
}

class Params extends Equatable {
  final String tvShowId;
  Params(this.tvShowId);

  @override
  List<Object> get props => <Object>[tvShowId];
}
