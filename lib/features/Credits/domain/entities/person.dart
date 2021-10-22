import 'package:equatable/equatable.dart';

/// Person Entity that extends Equatable
class Person extends Equatable {
  /// Default constructor
  const Person({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  /// adult
  final bool adult;

  /// the person is alson known as
  final List<String> alsoKnownAs;

  /// person's biography
  final String biography;

  /// person's birthday
  final String birthday;

  /// person's deathday
  final String deathday;

  /// person's gender
  final int gender;

  /// person's homepage
  final String homepage;

  /// person's id
  final int id;

  /// person's imdb id
  final String imdbId;

  /// person's department
  final String knownForDepartment;

  /// person's name
  final String name;

  /// person's place of birth
  final String placeOfBirth;

  /// person's popularity
  final num popularity;

  /// person's profile image path
  final String profilePath;

  @override
  List<Object> get props {
    return <Object>[
      adult,
      alsoKnownAs,
      biography,
      birthday,
      deathday,
      gender,
      homepage,
      id,
      imdbId,
      knownForDepartment,
      name,
      placeOfBirth,
      popularity,
      profilePath,
    ];
  }
}
