part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => <Object>[];
}

class PopularMoviesInitial extends PopularMoviesState {}

class Empty extends PopularMoviesState {}

class Loading extends PopularMoviesState {}

class Loaded extends PopularMoviesState {
  final List<Movie> movies;

  Loaded({required this.movies});

  @override
  List<Object> get props => <Object>[movies];
}

class Error extends PopularMoviesState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => <Object>[message];
}
