part of 'tv_credit_bloc.dart';

/// Abstract class for bloc state
abstract class TvCreditState extends Equatable {
  /// Constructor
  const TvCreditState();

  @override
  List<Object> get props => <Object>[];
}

/// Initial state 
class TvCreditInitial extends TvCreditState {}
/// loading state 
class TvCreditLoading extends TvCreditState {
  @override
  List<Object> get props => <Object>[];
}
/// loaded state that holds credit data 
class TvCreditLoaded extends TvCreditState {
  /// Constructor 
  const TvCreditLoaded({required this.credit});
  /// credit data 
  final Credit credit;
  @override
  List<Object> get props => <Object>[credit];
}

/// Error state that holds error message 
class TvCreditError extends TvCreditState {
  /// Constructor 
  const TvCreditError({required this.message});
  /// error message 
  final String message;
  @override
  List<Object> get props => <Object>[message];
}
