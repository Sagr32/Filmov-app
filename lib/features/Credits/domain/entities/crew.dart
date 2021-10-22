import 'package:equatable/equatable.dart';

/// Crew Entity that extends Equatable
class Crew extends Equatable {
  /// Default constructor
  const Crew({
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
  });

  /// is adult
  final bool adult;

  /// crew person gender male or female
  final int gender;

  /// crew person id
  final int id;

  /// crew person known department
  final String knownForDepartment;

  /// crew person name
  final String name;

  /// crew person original name
  final String originalName;

  /// crew person popularity
  final double popularity;

  /// crew person image profile path
  final String profilePath;

  /// credit collection id
  final String creditId;

  /// crew person department
  final String department;

  /// crew person job
  final String job;

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
      creditId,
      department,
      job,
    ];
  }
}
