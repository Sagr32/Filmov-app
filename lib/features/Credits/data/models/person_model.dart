import '../../../../core/constant/constants.dart';
import '../../domain/entities/person.dart';

/// Person model which is a subclass of Person
class PersonModel extends Person {
  /// Default Constructor
  const PersonModel({
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
  }) : super(
            adult: adult,
            alsoKnownAs: alsoKnownAs,
            biography: biography,
            birthday: birthday,
            deathday: deathday,
            gender: gender,
            homepage: homepage,
            id: id,
            imdbId: imdbId,
            knownForDepartment: knownForDepartment,
            name: name,
            placeOfBirth: placeOfBirth,
            popularity: popularity,
            profilePath: profilePath);

  /// Factory Constructor  that takes json and returns person model
  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        adult: json['adult'] as bool,
        alsoKnownAs: json['also_known_as'].cast<String>(),
        biography: json['biography'] as String,
        birthday: json['birthday'] as String,
        deathday: json['deathday'] ?? 'None',
        gender: json['gender'] as int,
        homepage: json['homepage'] ?? 'No HomePage',
        id: json['id'] as int,
        imdbId: json['imdb_id'] ?? 'N/A',
        knownForDepartment: json['known_for_department'] as String,
        name: json['name'] as String,
        placeOfBirth: json['place_of_birth'],
        popularity: (json['popularity']),
        profilePath: json['profile_path'] ?? kImagePlaceHolder,
      );

  ///  return json from model
  Map<String, dynamic> toJson() => {
        'adult': adult,
        'also_known_as': alsoKnownAs,
        'biography': biography,
        'birthday': birthday,
        'deathday': deathday,
        'gender': gender,
        'homepage': homepage,
        'id': id,
        'imdb_id': imdbId,
        'known_for_department': knownForDepartment,
        'name': name,
        'place_of_birth': placeOfBirth,
        'popularity': popularity,
        'profile_path': profilePath,
      };

  /// adult
  final bool adult;

  /// other names for person
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
}
