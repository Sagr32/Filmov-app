import 'package:equatable/equatable.dart';

/// Movie entity that extends Equatable
class Movie extends Equatable {
  /// Movie Constructor
  const Movie({
    required this.adult,
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
    required this.genreIds,
  });

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

  @override
  List<Object> get props => <Object>[
        adult,
        backdropPath,
        id,
        originalLanguage,
        title,
        overview,
        popularity,
        posterPath,
        releaseDate,
        voteAverage,
        voteCount,
        genreIds,
      ];
}
