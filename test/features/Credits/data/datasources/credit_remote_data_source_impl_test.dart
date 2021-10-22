import 'package:filmov/core/constant/endpoint.dart';
import 'package:filmov/core/error/exceptions.dart';
import 'package:filmov/features/Credits/data/datasources/credit_remote_data_source.dart';
import 'package:filmov/features/Credits/data/models/cast_model.dart';
import 'package:filmov/features/Credits/data/models/credit_model.dart';
import 'package:filmov/features/Credits/data/models/crew_model.dart';
import 'package:filmov/features/Credits/data/models/person_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../../fixture/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

Matcher uriStartsWith(String value) {
  return isA<Uri>().having((uri) => uri.toString(), 'uri', startsWith(value));
}

class FakeUri extends Fake implements Uri {}

void main() {
  late MockHttpClient client;
  late CreditRemoteDataSourceImpl remoteDataSourceImpl;
  final tMovieId = '6674';
  final tPersonId = '123';
  final tTvShowId = '567';

  final tPersonModel = PersonModel(
    adult: false,
    alsoKnownAs: ["Ryan Rodney Reynolds"],
    biography: "biography",
    birthday: "1976-10-23",
    deathday: "null",
    gender: 2,
    homepage: "nll",
    id: 15,
    imdbId: "6059",
    knownForDepartment: "Acting",
    name: "Ryan Reynolds",
    placeOfBirth: "Canada",
    popularity: 156.2,
    profilePath: "profilePath",
  );

  final tCreditModel = CreditModel(
    id: 1,
    cast: <CastModel>[
      CastModel(
          adult: false,
          gender: 1,
          id: 1,
          knownForDepartment: "Ellie",
          name: "Ellie Kemper",
          originalName: "Ellie Kemper",
          popularity: 1.5,
          profilePath: "profilePath",
          castId: 6,
          character: "character",
          creditId: "22",
          order: 1),
    ],
    crew: <CrewModel>[
      CrewModel(
        adult: false,
        gender: 1,
        id: 1,
        knownForDepartment: "Jake Johnson",
        name: "Jake Johnson",
        originalName: "Jake Johnson",
        popularity: 1.5,
        profilePath: "profilePath",
        creditId: "creditId",
        department: "department",
        job: "job",
      )
    ],
  );

  setUp(() {
    client = MockHttpClient();
    remoteDataSourceImpl = CreditRemoteDataSourceImpl(client: client);
    registerFallbackValue(FakeUri());
  });

  void setUpMockHttpClientSuccess200({required String fileName}) async {
    when(
      () => client.get(
        any(
          that: uriStartsWith('https'),
        ),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        await fixture(fileName: fileName),
        200,
      ),
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

  group(
    "getMovieCredit",
    () {
      final queryParameters = {"api_key": kApiKey};
      final uri =
          Uri.https(kBaseUrl, kMovieCreditEndpoint(tMovieId), queryParameters);
      test('''should perform a GET request on a URL with 
               endpoint and parameters''', () {
        setUpMockHttpClientSuccess200(fileName: "credit");
        remoteDataSourceImpl.getMovieCredit(movieId: tMovieId);
        verify(
          () => client.get(uri),
        );
      });

      test("should return Credit when the response code is 200 (success)",
          () async {
        //
        setUpMockHttpClientSuccess200(fileName: "credit");
        //
        final result =
            await remoteDataSourceImpl.getMovieCredit(movieId: tMovieId);
//
        expect(result, tCreditModel);
      });
      test(
          "should return ServerException when the response code is 404 (failed)",
          () async {
        //
        setUpMockHttpClientFailure404();
        //
        final call = remoteDataSourceImpl.getMovieCredit(movieId: tMovieId);
//
        expect(() => call, throwsA(TypeMatcher<ServerException>()));
      });
    },
  );

  group("getTvCredit", () {
    final queryParameters = {"api_key": kApiKey};
    final uri =
        Uri.https(kBaseUrl, kTvCreditEndpoint(tTvShowId), queryParameters);

    test('''should perform a GET request on a URL with 
               endpoint and parameters''', () {
      //
      setUpMockHttpClientSuccess200(fileName: "credit");
      //
      remoteDataSourceImpl.getTvCredit(tvShowId: tTvShowId);
      //
      verify(
        () => client.get(uri),
      );
    });

    test('should return Credit when the response code is 200 (success)',
        () async {
      //
      setUpMockHttpClientSuccess200(fileName: "credit");
      //
      final result =
          await remoteDataSourceImpl.getTvCredit(tvShowId: tTvShowId);
      //
      expect(result, tCreditModel);
    });

    test('should return  ServerException when the response code is 404 (failed)',
        ()  {
      //
      setUpMockHttpClientFailure404();
      //
      final call =  remoteDataSourceImpl.getTvCredit(tvShowId: tTvShowId);
      //
      expect(() => call, throwsA(TypeMatcher<ServerException>()));
    });
  });

  group("getPersonDetails", () {
    final queryParameters = {"api_key": kApiKey};
    final uri =
        Uri.https(kBaseUrl, kPersonDetailsEndpoint(tPersonId), queryParameters);
    test('''should perform a GET request on a URL with 
               endpoint and parameters''', () {
      //
      setUpMockHttpClientSuccess200(fileName: 'person');
      //
      remoteDataSourceImpl.getPersonDetails(personId: tPersonId);
      //
      verify(() => client.get(uri));
    });

    test('should return person details when the response code is 200 (success)',
        () async {
      //
      setUpMockHttpClientSuccess200(fileName: 'person');
      //
      final result =
          await remoteDataSourceImpl.getPersonDetails(personId: tPersonId);
      //

      expect(result, tPersonModel);
    });

    test('should return ServerException when the response code is 404 (failed)',
        ()  {
      //
      setUpMockHttpClientFailure404();
      //
      final call =
           remoteDataSourceImpl.getPersonDetails(personId: tPersonId);
      //
      expect(() => call, throwsA(TypeMatcher<ServerException>()));
    });
  });
}
