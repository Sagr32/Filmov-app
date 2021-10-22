part of 'person_details_bloc.dart';


/// Abstract class for bloc state
abstract class PersonDetailsState extends Equatable {
  /// Constructor 
  const PersonDetailsState();

  @override
  List<Object> get props => <Object>[];
}

/// Initial state 
class PersonDetailsInitial extends PersonDetailsState {}

/// Loading state
class PersonDetailsLoading extends PersonDetailsState {
  @override
  List<Object> get props => <Object>[];
}

/// Loaded state that holds person details data
class PersonDetailsLoaded extends PersonDetailsState {
  /// Constructor 
  const PersonDetailsLoaded({required this.person});
  /// person model that holds information
  final Person person;
  @override
  List<Object> get props => <Object>[person];
}

/// Error state that holds error message 
class PersonDetailsError extends PersonDetailsState {
  /// Constructor 
  const PersonDetailsError({required this.message});
  /// error message 
  final String message;
  @override
  List<Object> get props => <Object>[message];
}
