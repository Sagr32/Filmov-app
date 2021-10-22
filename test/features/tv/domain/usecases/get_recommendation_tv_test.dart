import 'package:dartz/dartz.dart';
import 'package:filmov/features/tv/domain/entities/tv.dart';
import 'package:filmov/features/tv/domain/repositories/tv_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:filmov/features/tv/domain/usecases/get_recommendation_tv.dart';

class MockTvRepository extends Mock implements TvRepository {}

void main() {
  late MockTvRepository mockTvRepository;
  late GetRecommendationTv usecase;
  final tTvShowId = '5564';
  final List<Tv> tTvModel = [
    Tv(
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
    ),
    Tv(
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
    ),
  ];
  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetRecommendationTv(mockTvRepository);
  });

  test('should get a list of [Tv]', () async {
    //
    when(() => mockTvRepository.getRecommendationTv(tvShowId: tTvShowId))
        .thenAnswer((invocation) async => Right(tTvModel));
    //
    final result = await usecase(Params(tTvShowId));
    //
    verify(() => mockTvRepository.getRecommendationTv(tvShowId: tTvShowId));
    expect(result, Right(tTvModel));
    verifyNoMoreInteractions(mockTvRepository);
  });
}
