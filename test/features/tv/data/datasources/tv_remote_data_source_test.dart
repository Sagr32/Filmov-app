
import 'dart:io';

import 'package:filmov/core/constant/endpoint.dart';
import 'package:filmov/core/error/exceptions.dart';
import 'package:filmov/features/tv/data/datasources/tv_remote_data_source.dart';
import 'package:filmov/features/tv/data/models/tv_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../../fixture/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

Matcher uriStartsWith(String value) {
  return isA<Uri>().having((uri) => uri.toString(), 'uri', startsWith(value));
}

class FakeUri extends Fake implements Uri {}

void main() {
  late MockHttpClient client;
  late TvRemoteDataSourceImpl remoteDataSourceImpl;
  final queryParameters = {"api_key": kApiKey};

  final tTvShowId = '5567';
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
    ),
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
    ),
  ];
  setUp(() {
    client = MockHttpClient();
    remoteDataSourceImpl = TvRemoteDataSourceImpl(client: client);
    registerFallbackValue(FakeUri());
  });

  void setUpMockHttpClientSuccess200() async {
    when(
      () => client.get(
        any(
          that: uriStartsWith('https'),
        ),
      ),
    ).thenAnswer(
      (_) async => http.Response(await fixture(fileName: "tvs"), 200, headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      }),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(
      () => client.get(
        any(
          that: uriStartsWith('https'),
        ),
      ),
    ).thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getPopularTv', () {
    final uri = Uri.https(kBaseUrl, kPopularTvEndpoint, queryParameters);

    test('should perform a GET request on a url with endpoint', () {
      //
      setUpMockHttpClientSuccess200();
      //
      remoteDataSourceImpl.getPopularTv();
      //
      verify(() => client.get(uri));
    });
    test('should return Tv Model when response code is 200', () async {
      //
      setUpMockHttpClientSuccess200();
      //
      final result = await remoteDataSourceImpl.getPopularTv();
      //
      expect(result, tTvModel);
    });
    test('should return ServerException when response code is 400 or else', () {
      //
      setUpMockHttpClientFailure404();
      //
      final call = remoteDataSourceImpl.getPopularTv();
      //
      expect(() => call, throwsA(TypeMatcher<ServerException>()));
    });
  });
  group('getRecommendationTv', () {
    final uri = Uri.https(
        kBaseUrl, kRecommendationTvEndpoint(tTvShowId), queryParameters);

    test('should perform a GET request on a url with endpoint', () {
      //
      setUpMockHttpClientSuccess200();
      //
      remoteDataSourceImpl.getRecommendationTv(tvShowId: tTvShowId);
      //
      verify(() => client.get(uri));
    });
    test('should return tv model when response code is 200', () async {
      //
      setUpMockHttpClientSuccess200();
      //
      final result =
          await remoteDataSourceImpl.getRecommendationTv(tvShowId: tTvShowId);
      //
      expect(result, tTvModel);
    });
    test('should return ServerException when response code is 400 or else', () {
      //
      setUpMockHttpClientFailure404();
      //
      final call =
          remoteDataSourceImpl.getRecommendationTv(tvShowId: tTvShowId);
      //
      expect(() => call, throwsA(TypeMatcher<ServerException>()));
    });
  });
  group('getTopRatedTv', () {
    final uri = Uri.https(kBaseUrl, kTopRatedTvEndpoint, queryParameters);

    test('should perform a GET request on a url with endpoint', () {
      //
      setUpMockHttpClientSuccess200();
      //
      remoteDataSourceImpl.getTopRatedTv();
      //
      verify(() => client.get(uri));
    });
    test('should return tv model when response code is 200', () async {
      //
      setUpMockHttpClientSuccess200();
      //
      final result = await remoteDataSourceImpl.getTopRatedTv();
      //
      expect(result, tTvModel);
    });
    test('should return ServerException when response code is 400 or else ',
        () {
      //
      setUpMockHttpClientFailure404();
      //
      final call = remoteDataSourceImpl.getTopRatedTv();
      //
      expect(() => call, throwsA(TypeMatcher<ServerException>()));
    });
  });
  group('getTrendingTv', () {
    final uri = Uri.https(kBaseUrl, kTrendingTvEndpoint, queryParameters);

    test('should perform a GET request on a url with endpoint', () {
      //
      setUpMockHttpClientSuccess200();
      //
      remoteDataSourceImpl.getTrendingTv();
      //
      verify(() => client.get(uri));
    });
    test('should return tv model when response code is 200', () async {
      //
      setUpMockHttpClientSuccess200();
      //
      final result = await remoteDataSourceImpl.getTrendingTv();
      //
      expect(result, tTvModel);
    });
    test('should return ServerException when response code is 400 else', () {
      //
      setUpMockHttpClientFailure404();
      //
      final call = remoteDataSourceImpl.getTrendingTv();
      //
      expect(() => call, throwsA(TypeMatcher<ServerException>()));
    });
  });
}
