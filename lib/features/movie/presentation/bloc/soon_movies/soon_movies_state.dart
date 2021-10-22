part of 'soon_movies_bloc.dart';

/// Soon Movies State
abstract class SoonMoviesState extends Equatable {
  /// default constructor
  const SoonMoviesState();

  @override
  List<Object> get props => <Object>[];
}

/// Initial state for soon movies
class SoonMoviesInitial extends SoonMoviesState {}

/// loading state for soon movies

class SoonMoviesLoading extends SoonMoviesState {
  @override
  List<Object> get props => <Object>[];
}

/// success or loaded state for soon movies
class SoonMoviesLoaded extends SoonMoviesState {
  /// default constructor
  const SoonMoviesLoaded({required this.movies});

  /// movies that return when success
  final List<Movie> movies;
  @override
  List<Object> get props => <Object>[movies];
}

/// state that emits when error occurs
class SoonMoviesError extends SoonMoviesState {
  /// default constructor
  const SoonMoviesError({required this.message});

  /// error message
  final String message;
  @override
  List<Object> get props => <Object>[message];
}
