part of 'movies_for_person_bloc.dart';

abstract class MoviesForPersonState extends Equatable {
  const MoviesForPersonState();

  @override
  List<Object> get props => <Object>[];
}

class MoviesForPersonInitial extends MoviesForPersonState {}

class MoviesForPersonLoading extends MoviesForPersonState {
  @override
  List<Object> get props => <Object>[];
}

class MoviesForPersonLoaded extends MoviesForPersonState {
  final List<Movie> movies;
  MoviesForPersonLoaded({required this.movies});
  @override
  List<Object> get props => <Object>[movies];
}

class MoviesForPersonError extends MoviesForPersonState {
  final String message;
  MoviesForPersonError({required this.message});
  @override
  List<Object> get props => <Object>[message];
}
