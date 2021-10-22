import '../../domain/entities/credit.dart';
import 'cast_model.dart';
import 'crew_model.dart';

/// Credit Model which is a subclass of Credit Entity
class CreditModel extends Credit {
  /// Constructor
  const CreditModel({
    required this.id,
    required this.cast,
    required this.crew,
  }) : super(cast: cast, crew: crew, id: id);

/// factory constructor that takes json and return credit model
  factory CreditModel.fromJson(Map<String, dynamic> json) {
    return CreditModel(
      id: json['id'] as int,
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'cast': cast.map((e) => e.toJson()).toList(),
        'crew': crew.map((e) => e.toJson()).toList(),
      };
  /// Credit model id
  final int id;

  /// List of Cast model
  final List<CastModel> cast;

  /// list of crew model
  final List<CrewModel> crew;
  
}
