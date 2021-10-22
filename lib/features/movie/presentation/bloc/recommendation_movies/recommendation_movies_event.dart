part of 'recommendation_movies_bloc.dart';

abstract class RecommendationMoviesEvent extends Equatable {
  const RecommendationMoviesEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetMoviesForRecommendation extends RecommendationMoviesEvent {
  final String movieId;
  GetMoviesForRecommendation({required this.movieId});

  @override
  List<Object> get props => <Object>[movieId];
}
