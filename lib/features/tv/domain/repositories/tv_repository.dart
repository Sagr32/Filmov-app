import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/tv.dart';

abstract class TvRepository {
  Future<Either<Failure, List<Tv>>> getPopularTv();
  Future<Either<Failure, List<Tv>>> getTopRatedTv();
  Future<Either<Failure, List<Tv>>> getTrendingTv();
  Future<Either<Failure, List<Tv>>> getRecommendationTv(
      {required String tvShowId});
}
