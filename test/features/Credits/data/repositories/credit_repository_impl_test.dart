import 'package:dartz/dartz.dart';
import 'package:filmov/core/error/exceptions.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/features/Credits/data/datasources/credit_remote_data_source.dart';
import 'package:filmov/features/Credits/data/models/cast_model.dart';
import 'package:filmov/features/Credits/data/models/credit_model.dart';
import 'package:filmov/features/Credits/data/models/crew_model.dart';
import 'package:filmov/features/Credits/data/models/person_model.dart';
import 'package:filmov/features/Credits/data/repositories/credit_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreditRemoteDataSource extends Mock
    implements CreditRemoteDataSource {}

void main() {
  late MockCreditRemoteDataSource remoteDataSource;
  late CreditRepositoryImpl repositoryImpl;

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

  final tPersonId = '12';
  final tMovieId = '6674';
  final tTvShowId = '54';
  setUp(() {
    remoteDataSource = MockCreditRemoteDataSource();
    repositoryImpl =
        CreditRepositoryImpl(creditRemoteDataSource: remoteDataSource);
  });

  group(
    'getMovieCredits method',
    () {
      test(
        'Should return Credit when calling remote data source is succesful ',
        () async {
          //
          when(() => remoteDataSource.getMovieCredit(movieId: tMovieId))
              .thenAnswer((_) async => (tCreditModel));
          //
          final result =
              await repositoryImpl.getMovieCredits(movieId: tMovieId);
          //
          expect(result, Right(tCreditModel));
        },
      );

      test(
        'Should return ServerException when calling remote data source failed',
        () async {
          //
          when(() => remoteDataSource.getMovieCredit(movieId: tMovieId))
              .thenThrow(ServerException());
          //
          final result =
              await repositoryImpl.getMovieCredits(movieId: tMovieId);
          //
          expect(result, Left(ServerFailure()));
        },
      );
    },
  );

  group(
    'getTvCredits method',
    () {
      test(
        'Should return Credit when calling remote data source is succesful ',
        () async {
          //
          when(() => remoteDataSource.getTvCredit(tvShowId: tTvShowId))
              .thenAnswer((_) async => (tCreditModel));
          //
          final result = await repositoryImpl.getTvCredits(tvShowId: tTvShowId);
          //
          expect(result, Right(tCreditModel));
        },
      );

      test(
        'Should return ServerException when calling remote data source failed',
        () async {
          //
          when(() => remoteDataSource.getTvCredit(tvShowId: tTvShowId))
              .thenThrow(ServerException());
          //
          final result = await repositoryImpl.getTvCredits(tvShowId: tTvShowId);
          //
          expect(result, Left(ServerFailure()));
        },
      );
    },
  );

  group(
    'getPersonDetails method',
    () {
      test(
        'Should return Person when calling remote data source is succesful ',
        () async {
          //
          when(() => remoteDataSource.getPersonDetails(personId: tPersonId))
              .thenAnswer((_) async => (tPersonModel));
          //
          final result =
              await repositoryImpl.getPersonDetails(personId: tPersonId);
          //
          expect(result, Right(tPersonModel));
        },
      );

      test(
        'Should return ServerException when calling remote data source failed',
        () async {
          //
          when(() => remoteDataSource.getPersonDetails(personId: tPersonId))
              .thenThrow(ServerException());
          //
          final result =
              await repositoryImpl.getPersonDetails(personId:tPersonId);
          //
          expect(result, Left(ServerFailure()));
        },
      );
    },
  );
}
