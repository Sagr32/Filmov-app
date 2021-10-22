

import 'package:filmov/core/constant/endpoint.dart';
import 'package:filmov/core/error/exceptions.dart';
import 'package:filmov/features/movie/data/datasources/movie_remote_datasource.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import '../../../../fixture/fixture_reader.dart';
import '../../../../test_constants.dart';

class MockHttpClient extends Mock implements http.Client {}

Matcher uriStartsWith(String value) {
  return isA<Uri>().having((uri) => uri.toString(), 'uri', startsWith(value));
}

class FakeUri extends Fake implements Uri {}

void main() async {
  late MockHttpClient httpClient;
  late MovieRemoteDataSourceImpl dataSource;

  final String tQuery = "Revenant";
  final String tMovieId = '6674';
  final String tPersonId = '123';
 
  setUp(() {
    httpClient = MockHttpClient();
    dataSource = MovieRemoteDataSourceImpl(client: httpClient);
    registerFallbackValue(FakeUri());
  });

  void setUpMockHttpClientSuccess200() async {
    when(
      () => httpClient.get(
        any(
          that: uriStartsWith('https'),
        ),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        await fixture(fileName: "movies"),
        200,
      ),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(
      () => httpClient.get(
        any(
          that: uriStartsWith('https'),
        ),
      ),
    ).thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group(
    "getTrendingMovies",
    () {
      final queryParameters = {"api_key": kApiKey};
      final uri = Uri.https(kBaseUrl, kTrendingMoviesEndpoint, queryParameters);
      test('''should perform a GET request on a URL with 
               endpoint and header''', () {
        setUpMockHttpClientSuccess200();
        dataSource.getTrendingMovies();
        verify(
          () => httpClient.get(uri),
        );
      });

      test("should return  Movie when the response code is 200 (success)",
          () async {
        setUpMockHttpClientSuccess200();
        final result = await dataSource.getTrendingMovies();

        expect(result, tMoviesModel);
      });
      test(
          "should return  ServerException when the response code is 404 (failed)",
          () async {
        setUpMockHttpClientFailure404();
        final call = dataSource.getTrendingMovies();

        expect(() => call, throwsA(TypeMatcher<ServerException>()));
      });
    },
  );

  group(
    "getSoonMovies",
    () {
      final queryParameters = {"api_key": kApiKey, "year": "2022"};
      final uri = Uri.https(kBaseUrl, kSoonMoviesEndpoint, queryParameters);

      test('''should perform a GET request on a URL with 
               endpoint and header''', () {
        setUpMockHttpClientSuccess200();
        dataSource.getSoonMovies();
        verify(
          () => httpClient.get(
            uri,
          ),
        );
      });

      test("should return  Movie when the response code is 200 (success)",
          () async {
        setUpMockHttpClientSuccess200();
        final result = await dataSource.getSoonMovies();

        expect(result, tMoviesModel);
      });
      test(
          "should return  ServerException when the response code is 404 (failed)",
          () async {
        setUpMockHttpClientFailure404();
        final call = dataSource.getSoonMovies();

        expect(() => call, throwsA(TypeMatcher<ServerException>()));
      });
    },
  );

  group(
    "SearchMovies",
    () {
      test('''should perform a GET request on a URL with 
               endpoint and header''', () {
        final queryParameters = {"api_key": kApiKey, 'query': tQuery};
        final uri = Uri.https(kBaseUrl, kSearchMoviesEndpoint, queryParameters);
        setUpMockHttpClientSuccess200();
        dataSource.searchMovies(query: tQuery);
        verify(
          () => httpClient.get(
            uri,
          ),
        );
      });

      test("should return  Movie when the response code is 200 (success)",
          () async {
        setUpMockHttpClientSuccess200();
        final result = await dataSource.searchMovies(query: tQuery);

        expect(result, tMoviesModel);
      });
      test(
          "should return  ServerException when the response code is 404 (failed)",
          () async {
        setUpMockHttpClientFailure404();
        final call = dataSource.searchMovies(query: tQuery);

        expect(() => call, throwsA(TypeMatcher<ServerException>()));
      });
    },
  );

  group(
    "MoviesForPerson",
    () {
      test('''should perform a GET request on a URL with 
               endpoint and header''', () {
        final queryParameters = {
          "api_key": kApiKey,
        };
        final uri = Uri.https(
            kBaseUrl, kMovieForPersonEndpoint(tPersonId), queryParameters);
        setUpMockHttpClientSuccess200();
        dataSource.getMoviesForPerson(personId: tPersonId);
        verify(
          () => httpClient.get(
            uri,
          ),
        );
      });

      test("should return  Movie when the response code is 200 (success)",
          () async {
        setUpMockHttpClientSuccess200();
        final result = await dataSource.getMoviesForPerson(personId: tPersonId);

        expect(result, tMoviesModel);
      });
      test(
          "should return  ServerException when the response code is 404 (failed)",
          () async {
        setUpMockHttpClientFailure404();
        final call = dataSource.getMoviesForPerson(personId: tPersonId);

        expect(() => call, throwsA(TypeMatcher<ServerException>()));
      });
    },
  );

  group(
    "PopularMovies",
    () {
      test('''should perform a GET request on a URL with 
               endpoint and header''', () {
        final queryParameters = {
          "api_key": kApiKey,
        };
        final uri =
            Uri.https(kBaseUrl, kPopularMoviesEndpoint, queryParameters);
        setUpMockHttpClientSuccess200();
        dataSource.getPopularMovies();
        verify(
          () => httpClient.get(
            uri,
          ),
        );
      });

      test("should return  Movie when the response code is 200 (success)",
          () async {
        setUpMockHttpClientSuccess200();
        final result = await dataSource.getPopularMovies();

        expect(result, tMoviesModel);
      });
      test(
          "should return  ServerException when the response code is 404 (failed)",
          () async {
        setUpMockHttpClientFailure404();
        final call = dataSource.getPopularMovies();

        expect(() => call, throwsA(TypeMatcher<ServerException>()));
      });
    },
  );

  group(
    "Recommendation Movies",
    () {
      test('''should perform a GET request on a URL with 
               endpoint and header''', () {
        final queryParameters = {
          "api_key": kApiKey,
        };
        final uri = Uri.https(
            kBaseUrl, kRecommendationEndpoint(tMovieId), queryParameters);
        setUpMockHttpClientSuccess200();
        dataSource.getRecommendationMovies(movieId: tMovieId);
        verify(
          () => httpClient.get(
            uri,
          ),
        );
      });

      test("should return  Movie when the response code is 200 (success)",
          () async {
        setUpMockHttpClientSuccess200();
        final result =
            await dataSource.getRecommendationMovies(movieId: tMovieId);

        expect(result, tMoviesModel);
      });
      test(
          "should return  ServerException when the response code is 404 (failed)",
          () async {
        setUpMockHttpClientFailure404();
        final call = dataSource.getRecommendationMovies(movieId: tMovieId);

        expect(() => call, throwsA(TypeMatcher<ServerException>()));
      });
    },
  );

  group(
    "TopRated Movies",
    () {
      test('''should perform a GET request on a URL with 
               endpoint and header''', () {
        final queryParameters = {
          "api_key": kApiKey,
        };
        final uri = Uri.https(kBaseUrl, kTopRatedEndpoint, queryParameters);
        setUpMockHttpClientSuccess200();
        dataSource.getTopRatedMovies();
        verify(
          () => httpClient.get(
            uri,
          ),
        );
      });

      test("should return  Movie when the response code is 200 (success)",
          () async {
        setUpMockHttpClientSuccess200();
        final result = await dataSource.getTopRatedMovies();

        expect(result, tMoviesModel);
      });
      test(
          "should return  ServerException when the response code is 404 (failed)",
          () async {
        setUpMockHttpClientFailure404();
        final call = dataSource.getTopRatedMovies();

        expect(() => call, throwsA(TypeMatcher<ServerException>()));
      });
    },
  );
}
