part of 'person_details_bloc.dart';


/// Abstract class for event
abstract class PersonDetailsEvent extends Equatable {
  /// Constructor
  const PersonDetailsEvent();

  @override
  List<Object> get props => <Object>[];
}

/// event to get person details
class GetPersonDetailsEvent extends PersonDetailsEvent {
  /// Constructor
  const GetPersonDetailsEvent({required this.personId});
  /// target person id 
  final String personId;

  @override
  List<Object> get props => <Object>[personId];
}
