
import 'package:dartz/dartz.dart';
import 'package:filmov/core/error/exceptions.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/features/tv/data/datasources/tv_remote_data_source.dart';
import 'package:filmov/features/tv/data/models/tv_model.dart';
import 'package:filmov/features/tv/data/repositories/tv_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTvRemoteDataSource extends Mock implements TvRemoteDataSource {}

void main() {
  late MockTvRemoteDataSource remoteDataSource;
  late TvRepositoryImpl repositoryImpl;

  setUp(() {
    remoteDataSource = MockTvRemoteDataSource();
    repositoryImpl = TvRepositoryImpl(tvRemoteDataSource: remoteDataSource);
  });
  final tTvShowId = '5564';
  final List<TvModel> tTvModel = [
    TvModel(
      genreIds: [10759, 9648, 18],
      originalName: "오징어 게임",
      name: "Squid Game",
      id: 93405,
      posterPath: "/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg",
      firstAirDate: "2021-09-17",
      voteAverage: 7.9,
      overview:
          "Hundreds of cash-strapped players accept a strange invitation to compete in children's games—with high stakes. But, a tempting prize awaits the victor.",
      voteCount: 7127,
      originCountry: ["KR"],
      backdropPath: "/oaGvjB0DvdhXhOAuADfHb261ZHa.jpg",
      originalLanguage: "ko",
      popularity: 7949.302,
    )
  ];

  group('getPopularTv ', () {
    test(
        "should return list of [TvModel] when calling remote data source success",
        () async {
      //
      when(() => remoteDataSource.getPopularTv())
          .thenAnswer((_) async => (tTvModel));
      //
      final result = await repositoryImpl.getPopularTv();
      //
      expect(result, Right(tTvModel));
    });

    test(
        'should return server exception when calling remote data source failed',
        () async {
      //
      when(() => remoteDataSource.getPopularTv()).thenThrow(ServerException());
      //
      final result = await repositoryImpl.getPopularTv();
      //
      expect(result, Left(ServerFailure()));
    });
  });

  group("getRecommendationTv ", () {
    test(
        'should return list of [TvModel] when calling remote data source success',
        () async {
      //
      when(() => remoteDataSource.getRecommendationTv(tvShowId: tTvShowId))
          .thenAnswer((invocation) async => tTvModel);
      //
      final result =
          await repositoryImpl.getRecommendationTv(tvShowId: tTvShowId);
      //
      expect(result, Right(tTvModel));
    });

    test(
        'should return server exception when calling remote data source failed',
        () async {
      //
      when(() => remoteDataSource.getRecommendationTv(tvShowId: tTvShowId))
          .thenThrow(ServerException());
      //
      final result =
          await repositoryImpl.getRecommendationTv(tvShowId: tTvShowId);
      //
      expect(result, Left(ServerFailure()));
    });
  });

  group('getTopRatedTv', () {
    test('should return list of [TvModel] when calling remote data source ',
        () async {
      //
      when(() => remoteDataSource.getTopRatedTv())
          .thenAnswer((invocation) async => tTvModel);
      //
      final result = await repositoryImpl.getTopRatedTv();
      //
      expect(result, Right(tTvModel));
    });

    test(
        'should return server exception when calling remote data source failed',
        () async {
      //
      when(() => remoteDataSource.getTopRatedTv()).thenThrow(ServerException());
      //
      final result = await repositoryImpl.getTopRatedTv();
      //
      expect(result, Left(ServerFailure()));
    });
  });

  group('getTrendingTv', () {
    test('should return list of [tvModel] when calling remote data source',
        () async {
      //
      when(() => remoteDataSource.getTrendingTv())
          .thenAnswer((invocation) async => tTvModel);
      //
      final result = await repositoryImpl.getTrendingTv();
      //
      expect(result, Right(tTvModel));
    });
    test(
        'should return server exception when calling remote data source failed',
        ()async {
      //
      when(() => remoteDataSource.getTrendingTv()).thenThrow(ServerException());
      //
      final result = await repositoryImpl.getTrendingTv();
      //
      expect(result, Left(ServerFailure()));
    });
  });
}
