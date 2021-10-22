import '../../domain/entities/crew.dart';

/// Crew model which is a subclass from Crew Entity
class CrewModel extends Crew {
  /// Default Constructor
  const CrewModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  }) : super(
          adult: adult,
          creditId: creditId,
          department: department,
          gender: gender,
          id: id,
          job: job,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
        );
/// factory constructor which takes json and return 
/// crew model
  factory CrewModel.fromJson(Map<String, dynamic> json) => CrewModel(
        adult: json['adult'] as bool,
        gender: json['gender'] as int,
        id: json['id'] as int,
        knownForDepartment: json['known_for_department'] as String,
        name: json['name'] as String,
        originalName: json['original_name'] as String,
        popularity: (json['popularity'] as num).toDouble(),
        profilePath: json['profile_path'] ?? "None",
        creditId: json['credit_id'] as String,
        department: json['department'] as String,
        job: json['job'] as String,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'gender': gender,
        'id': id,
        'known_for_department': knownForDepartment,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
        'credit_id': creditId,
        'department': department,
        'job': job,
      };
  ///     adult
  final bool adult;

  /// male or female
  final int gender;

  /// person id
  final int id;

  /// person is known for which department
  final String knownForDepartment;

  /// person name which can be alias name
  final String name;

  /// person original name
  final String originalName;

  /// person popularity
  final double popularity;

  /// person image profile path
  final String profilePath;

  /// credit collection id
  final String creditId;

  /// person's department
  final String department;

  /// person's job
  final String job;

}
