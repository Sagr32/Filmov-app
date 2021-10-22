part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => <Object>[];
}

class TopRatedMoviesInitial extends TopRatedMoviesState {
  @override
  List<Object> get props => <Object>[];
}

class TopRatedMoviesLoading extends TopRatedMoviesState {
  @override
  List<Object> get props => <Object>[];
}

class TopRatedMoviesLoaded extends TopRatedMoviesState {
  final List<Movie> movies;
  TopRatedMoviesLoaded({required this.movies});
  @override
  List<Object> get props => <Object>[movies];
}

class TopRatedMoviesError extends TopRatedMoviesState {
  final String message;
  TopRatedMoviesError({required this.message});
  @override
  List<Object> get props => <Object>[message];
}
