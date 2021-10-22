import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/tv.dart';
import '../../domain/repositories/tv_repository.dart';
import '../datasources/tv_remote_data_source.dart';

typedef Future<List<Tv>> _TvChooser();

class TvRepositoryImpl implements TvRepository {
  final TvRemoteDataSource tvRemoteDataSource;
  TvRepositoryImpl({required this.tvRemoteDataSource});

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async {
    return await _getTv(() {
      return tvRemoteDataSource.getPopularTv();
    });
  }

  @override
  Future<Either<Failure, List<Tv>>> getRecommendationTv(
      {required String tvShowId}) async {
    return await _getTv(() {
      return tvRemoteDataSource.getRecommendationTv(tvShowId: tvShowId);
    });
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async {
    return await _getTv(() {
      return tvRemoteDataSource.getTopRatedTv();
    });
  }

  @override
  Future<Either<Failure, List<Tv>>> getTrendingTv() async {
    return await _getTv(() {
      return tvRemoteDataSource.getTrendingTv();
    });
  }

  Future<Either<Failure, List<Tv>>> _getTv(_TvChooser chooserFunc) async {
    try {
      final remoteTv = await chooserFunc();

      return Right(remoteTv);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
