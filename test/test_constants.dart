import 'package:filmov/features/Credits/data/models/cast_model.dart';
import 'package:filmov/features/Credits/data/models/credit_model.dart';
import 'package:filmov/features/Credits/data/models/crew_model.dart';
import 'package:filmov/features/Credits/data/models/person_model.dart';
import 'package:filmov/features/movie/data/models/movie_model.dart';
import 'package:filmov/features/movie/domain/entities/movie.dart';
import 'package:filmov/features/tv/domain/entities/tv.dart';

const String tMovieId = '6674';
const String tQuery = 'Revenant';
const tPersonId = '12';
const String tTvShowId = '567';
const String kErrorMessage = 'Something went wrong, please try again later';
const tPersonModel = PersonModel(
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

List<MovieModel> tMoviesModel = [
  MovieModel(
    adult: false,
    backdropPath: "backdrop path test",
    id: 436969,
    originalLanguage: "en",
    overview: "The Suicide Squad overview",
    popularity: 1723.518,
    posterPath: "poster path test",
    releaseDate: "2021-07-28",
    title: "The Suicide Squad",
    voteAverage: 7.8,
    voteCount: 4205,
    genreIds: [28, 12, 14, 35],
  ),
  MovieModel(
    adult: false,
    backdropPath: "backdrop path test",
    id: 436969,
    originalLanguage: "en",
    overview: "The Suicide Squad overview",
    popularity: 1723.518,
    posterPath: "poster path test",
    releaseDate: "2021-07-28",
    title: "The Suicide Squad",
    voteAverage: 7.8,
    voteCount: 4205,
    genreIds: [28, 12, 14, 35],
  ),
];


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

  final tCastModel = CastModel(
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
    order: 1);

final tCrewModel = CrewModel(
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
);

List<Movie> tMovies = [
  Movie(
    adult: false,
    backdropPath: "",
    id: 10,
    originalLanguage: "originalLanguage",
    title: "title",
    overview: "overview",
    popularity: 12,
    posterPath: "posterPath",
    releaseDate: "releaseDate",
    voteAverage: 14,
    voteCount: 15,
     genreIds: [28, 12, 14, 35],
  ),
  Movie(
    adult: false,
    backdropPath: "",
    id: 10,
    originalLanguage: "originalLanguage",
    title: "title",
    overview: "overview",
    popularity: 12,
    posterPath: "posterPath",
    releaseDate: "releaseDate",
    voteAverage: 14,
    voteCount: 15,
     genreIds: [28, 12, 14, 35],
  ),
];

final List<Tv> tTvEntity = [
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
