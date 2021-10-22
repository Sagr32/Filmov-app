import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constant/endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../models/credit_model.dart';
import '../models/person_model.dart';

/// Credit model remote data source
abstract class CreditRemoteDataSource {
  /// Calls the [baseUrl]/3/movie/[movieId]/credits endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  Future<CreditModel> getMovieCredit({required String movieId});

  /// Calls the [baseUrl]/3/tv/[tvShowId]/credits endpoint. with year parameter
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CreditModel> getTvCredit({required String tvShowId});

  /// Calls the [baseUrl]/3/person/[personId] endpoint. with year parameter
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PersonModel> getPersonDetails({required String personId});
}

/// Implementation of credit remote source
class CreditRemoteDataSourceImpl implements CreditRemoteDataSource {
  /// Constructor
  CreditRemoteDataSourceImpl({required this.client});

  /// http client
  final http.Client client;

  @override
  Future<CreditModel> getMovieCredit({required String movieId}) {
    return _getCreditFromUrl(endPoint: kMovieCreditEndpoint(movieId));
  }

  @override
  Future<CreditModel> getTvCredit({required String tvShowId}) {
    return _getCreditFromUrl(endPoint: kTvCreditEndpoint(tvShowId));
  }

  @override
  Future<PersonModel> getPersonDetails({required String personId}) async {
    final queryParameters = {'api_key': kApiKey};
    final uri =
        Uri.https(kBaseUrl, kPersonDetailsEndpoint(personId), queryParameters);

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return PersonModel.fromJson((json.decode(response.body)));
      } else {
        throw ServerException();
      }
    } on Exception catch (_) {
      throw ServerException();
    }
  }

  Future<CreditModel> _getCreditFromUrl({
    required String endPoint,
  }) async {
    final queryParameters = {'api_key': kApiKey};
    final uri = Uri.https(kBaseUrl, endPoint, queryParameters);

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return CreditModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } on Exception catch (_) {
      throw ServerException();
    }
  }
}
