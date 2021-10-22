part of 'trending_movies_bloc.dart';

abstract class TrendingMoviesState extends Equatable {
  const TrendingMoviesState();

  @override
  List<Object> get props => <Object>[];
}

class TrendingMoviesInitial extends TrendingMoviesState {
  @override
  List<Object> get props => <Object>[];
}

class TrendingMoviesLoading extends TrendingMoviesState {
  @override
  List<Object> get props => <Object>[];
}

class TrendingMoviesLoaded extends TrendingMoviesState {
  final List<Movie> movies;
  TrendingMoviesLoaded({required this.movies});
  @override
  List<Object> get props => <Object>[movies];
}

class TrendingMoviesError extends TrendingMoviesState {
  final String message;
  TrendingMoviesError({required this.message});
  @override
  List<Object> get props => <Object>[message];
}
