import 'package:dartz/dartz.dart';
import 'package:filmov/core/usecase/usecase.dart';
import 'package:filmov/features/tv/domain/entities/tv.dart';
import 'package:filmov/features/tv/domain/repositories/tv_repository.dart';
import 'package:filmov/features/tv/domain/usecases/get_trending_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTvRepository extends Mock implements TvRepository {}

void main() {
  late MockTvRepository mockTvRepository;
  late GetTrendingTv usecase;
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
    usecase = GetTrendingTv(mockTvRepository);
  });

  test('should return list of [Tv]', () async{
    //
    when(() => mockTvRepository.getTrendingTv())
        .thenAnswer((invocation) async => Right(tTvModel));
    //
    final result = await usecase(NoParams());
    //
    verify(() => mockTvRepository.getTrendingTv());
    expect(result, Right(tTvModel));
    verifyNoMoreInteractions(mockTvRepository);
  });
}
