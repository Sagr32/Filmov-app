import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/tv.dart';
import '../repositories/tv_repository.dart';

class GetPopularTv implements UseCase<List<Tv>, NoParams> {
  final TvRepository tvRepository;

  GetPopularTv(this.tvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParams params) async {
    return await tvRepository.getPopularTv();
  }
}
