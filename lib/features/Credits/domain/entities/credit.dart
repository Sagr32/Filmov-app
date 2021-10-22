import 'package:equatable/equatable.dart';

import 'cast.dart';
import 'crew.dart';

/// Credit Entity that extends Equatable
class Credit extends Equatable {
  /// Default Constructor
  const Credit({required this.id, required this.cast, required this.crew});

  /// Credit id
  final int id;

  /// list of cast
  final List<Cast> cast;

  /// list of crew
  final List<Crew> crew;

  @override
  List<Object> get props => <Object>[id, cast, crew];
}
