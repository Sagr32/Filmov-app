import 'package:equatable/equatable.dart';

/// Cast Entity that extends Equatable
class Cast extends Equatable {
  /// Default Constructor
  const Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  /// is adult ?
  final bool adult;

  /// male or female gender
  final int gender;

  /// cast collection id
  final int id;

  /// which department is known for
  final String knownForDepartment;

  /// ast person  name
  final String name;

  /// ast person  original name
  final String originalName;

  /// cast person popularity
  final double popularity;

  /// cast person profile image path
  final String profilePath;

  /// cast collection id
  final int castId;

  /// character name in the movie
  final String character;

  /// credit id
  final String creditId;

  ///
  final int order;

  @override
  List<Object> get props {
    return <Object>[
      adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      castId,
      character,
      creditId,
      order,
    ];
  }
}
