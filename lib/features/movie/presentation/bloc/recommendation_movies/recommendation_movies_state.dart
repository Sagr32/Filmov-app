part of 'recommendation_movies_bloc.dart';

abstract class RecommendationMoviesState extends Equatable {
  const RecommendationMoviesState();

  @override
  List<Object> get props => <Object>[];
}

class RecommendationMoviesInitial extends RecommendationMoviesState {}

class RecommendationMoviesLoading extends RecommendationMoviesState {
  @override
  List<Object> get props => <Object>[];
}

class RecommendationMoviesLoaded extends RecommendationMoviesState {
  final List<Movie> movies;
  RecommendationMoviesLoaded({required this.movies});
  @override
  List<Object> get props => <Object>[movies];
}

class RecommendationMoviesError extends RecommendationMoviesState {
  final String message;
  RecommendationMoviesError({required this.message});
  @override
  List<Object> get props => <Object>[message];
}
