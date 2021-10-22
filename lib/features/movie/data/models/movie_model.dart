import '../../domain/entities/movie.dart';

/// Movie model which is a subclass of movie entity
class MovieModel extends Movie {
  /// Constructor
  MovieModel(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.originalLanguage,
      required this.title,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.voteCount,
      required this.genreIds})
      : super(
            adult: adult,
            backdropPath: backdropPath,
            id: id,
            originalLanguage: originalLanguage,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title,
            voteAverage: voteAverage,
            voteCount: voteCount,
            genreIds: genreIds);


/// Factory Constructor that takes json and return Movie model
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'] ?? 'image',
        id: json['id'],
        originalLanguage: json['original_language'],
        title: json['title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'] ?? 'Empty',
        releaseDate: json['release_date'] ?? 'Empty',
        genreIds: json['genre_ids'].cast<int>(),
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
/// return json
  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'original_language': originalLanguage,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'genre_ids': genreIds,
    };
  }

  /// is movie for adult or not
  final bool adult;

  /// movie back drop path image
  final String backdropPath;

  /// movie id
  final int id;

  /// movie original language
  final String originalLanguage;

  /// movie title
  final String title;

  /// movie overview
  final String overview;

  /// movie popularity
  final num popularity;

  /// movie image poster path
  final String posterPath;

  /// movie release date
  final String releaseDate;

  /// movie vote average
  final num voteAverage;

  /// movie vote count
  final int voteCount;

  /// movie genres list
  final List<int> genreIds;


}
