import '../../domain/entities/cast.dart';

/// Cast model which is Cast entity sub class
class CastModel extends Cast {
  /// Constrictor
  const CastModel({
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
  }) : super(
            adult: adult,
            castId: castId,
            character: character,
            creditId: creditId,
            gender: gender,
            id: id,
            knownForDepartment: knownForDepartment,
            name: name,
            order: order,
            originalName: originalName,
            popularity: popularity,
            profilePath: profilePath);

  /// From Json is a factory constructor that takes json
  /// as map and return cast model
  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        adult: json['adult'] as bool,
        gender: json['gender'] as int,
        id: json['id'] as int,
        knownForDepartment: json['known_for_department'] ?? "None",
        name: json['name'] as String,
        originalName: json['original_name'] as String,
        popularity: (json['popularity'] as num).toDouble(),
        profilePath: json['profile_path'] ?? 'None',
        castId: json['cast_id'] ?? 0,
        character: json['character'] as String,
        creditId: json['credit_id'] as String,
        order: json['order'] as int,
      );

  /// To Json convert cast model to json
  Map<String, dynamic> toJson() => <String, dynamic>{
        'adult': adult,
        'gender': gender,
        'id': id,
        'known_for_department': knownForDepartment,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
        'cast_id': castId,
        'character': character,
        'credit_id': creditId,
        'order': order,
      };

  ///
  final bool adult;

  ///male or female
  final int gender;

  /// person id
  final int id;

  /// what he/she known for
  final String knownForDepartment;

  /// person name
  final String name;

  /// person original name
  final String originalName;

  /// person popularity
  final double popularity;

  /// profile image path
  final String profilePath;

  /// cast collection id
  final int castId;

  /// name of played character
  final String character;

  /// credit collection id
  final String creditId;

  ///
  final int order;
}
