import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constant/endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../models/movie_model.dart';

/// Remote data source for Movies
abstract class MovieRemoteDataSource {
  /// Calls the [baseUrl]/3/trending/movie/week  endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  Future<List<MovieModel>> getTrendingMovies();

  /// Calls the [baseUrl]//3/discover/movie endpoint. with year parameter
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getSoonMovies();

  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  Future<List<MovieModel>> searchMovies({required String query});

  /// Calls the [baseUrl]/3/movie/popular endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getPopularMovies();

  /// Calls the [baseUrl]/3/movie/top_rated endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getTopRatedMovies();

  /// Calls the [baseUrl]/3/movie/[movieId]/recommendations endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getRecommendationMovies({required String movieId});

  /// Calls the [baseUrl]/3/person/[personId]/movie_credits endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getMoviesForPerson({required String personId});
}

/// Remote data source implementation
/// Constructor
/// dio client

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getTrendingMovies() async => _getMovieFromUrl(
      endPoint: kTrendingMoviesEndpoint,
      queryParameters: {'api_key': kApiKey},
      jsonKey: 'results');

  @override
  Future<List<MovieModel>> getSoonMovies() async => _getMovieFromUrl(
        endPoint: kSoonMoviesEndpoint,
        queryParameters: {'api_key': kApiKey, 'year': '2022'},
        jsonKey: 'results',
      );

  @override
  Future<List<MovieModel>> searchMovies({required String query}) {
    return _getMovieFromUrl(
      endPoint: kSearchMoviesEndpoint,
      queryParameters: {'api_key': kApiKey, 'query': query},
      jsonKey: 'results',
    );
  }

  @override
  Future<List<MovieModel>> getPopularMovies() {
    return _getMovieFromUrl(
        endPoint: kPopularMoviesEndpoint,
        queryParameters: {
          'api_key': kApiKey,
        },
        jsonKey: 'results');
  }

  @override
  Future<List<MovieModel>> getRecommendationMovies({required String movieId}) {
    return _getMovieFromUrl(
      endPoint: kRecommendationEndpoint(movieId),
      queryParameters: {
        'api_key': kApiKey,
      },
      jsonKey: 'results',
    );
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() {
    return _getMovieFromUrl(
      endPoint: kTopRatedEndpoint,
      queryParameters: {
        'api_key': kApiKey,
      },
      jsonKey: 'results',
    );
  }

  @override
  Future<List<MovieModel>> getMoviesForPerson({required String personId}) {
    return _getMovieFromUrl(
      endPoint: kMovieForPersonEndpoint(personId),
      queryParameters: {
        'api_key': kApiKey,
      },
      jsonKey: 'cast',
    );
  }

  Future<List<MovieModel>> _getMovieFromUrl(
      {required String endPoint,
      required Map<String, dynamic> queryParameters,
      required String jsonKey}) async {
    final uri = Uri.https(kBaseUrl, endPoint, queryParameters);

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final myList = (json.decode(response.body))[jsonKey];
        final List<MovieModel> list = myList
            .map<MovieModel>((data) => MovieModel.fromJson(data))
            .toList();

        return list;
      } else {
        throw ServerException();
      }
    } on Exception catch (_) {
      throw ServerException();
    }
  }
}
