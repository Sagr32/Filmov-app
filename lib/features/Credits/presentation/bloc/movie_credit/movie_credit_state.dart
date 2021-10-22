part of 'movie_credit_bloc.dart';


/// Abstract movie credit state class
abstract class MovieCreditState extends Equatable {
  /// Constructor
  const MovieCreditState();

  @override
  List<Object> get props => <Object>[];
}

/// Initial state
class MovieCreditInitial extends MovieCreditState {}
/// Loading state
class MovieCreditLoading extends MovieCreditState {
  @override
  List<Object> get props => <Object>[];
}

/// Loaded state
class MovieCreditLoaded extends MovieCreditState {
  /// Constructor
  const MovieCreditLoaded({required this.credit});
  /// return data type [Credit]
  final Credit credit;
  @override
  List<Object> get props => <Object>[credit];
}
/// Error state
class MovieCreditError extends MovieCreditState {
  /// Constructor
  const MovieCreditError({required this.message});
  /// error message
  final String message;
  @override
  List<Object> get props => <Object>[message];
}
