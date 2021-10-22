import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constant/endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../models/tv_model.dart';

abstract class TvRemoteDataSource {
  /// Calls the [baseUrl]/3/trending/Tv/week  endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  Future<List<TvModel>> getTrendingTv();

  /// Calls the [baseUrl]/3/tv/popular endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<TvModel>> getPopularTv();

  /// Calls the [baseUrl]/3/tv/top_rated endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  Future<List<TvModel>> getTopRatedTv();

  /// Calls the [baseUrl]/3/tv/[tvShowId]/recommendations endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<TvModel>> getRecommendationTv({required String tvShowId});
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  final http.Client client;
  TvRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvModel>> getPopularTv() {
    return _getTvFromUrl(endPoint: kPopularTvEndpoint);
  }

  @override
  Future<List<TvModel>> getRecommendationTv({required String tvShowId}) {
    return _getTvFromUrl(endPoint: kRecommendationTvEndpoint(tvShowId));
  }

  @override
  Future<List<TvModel>> getTopRatedTv() {
    return _getTvFromUrl(endPoint: kTopRatedTvEndpoint);
  }

  @override
  Future<List<TvModel>> getTrendingTv() {
    return _getTvFromUrl(endPoint: kTrendingTvEndpoint);
  }

  Future<List<TvModel>> _getTvFromUrl({
    required String endPoint,
  }) async {
    final queryParameters = {
      'api_key': kApiKey,
    };

    final uri = Uri.https(kBaseUrl, endPoint, queryParameters);

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final myList = (json.decode(response.body))["results"];

        final List<TvModel> list =
            myList.map<TvModel>((data) => TvModel.fromJson(data)).toList();

        return list;
      } else {
        throw ServerException();
      }
    } on Exception catch (_) {
      throw ServerException();
    }
  }
}
