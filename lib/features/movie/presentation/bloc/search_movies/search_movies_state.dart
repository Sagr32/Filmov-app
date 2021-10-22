part of 'search_movies_bloc.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => <Object>[];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {
  @override
  List<Object> get props => <Object>[];
}

class SearchMoviesLoaded extends SearchMoviesState {
  final List<Movie> movies;
  SearchMoviesLoaded({required this.movies});
  @override
  List<Object> get props => <Object>[movies];
}

class SearchMoviesError extends SearchMoviesState {
  final String message;
  SearchMoviesError({required this.message});
  @override
  List<Object> get props => <Object>[message];
}
