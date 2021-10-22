part of 'recommendation_tv_bloc.dart';

abstract class RecommendationTvState extends Equatable {
  const RecommendationTvState();

  @override
  List<Object> get props => <Object>[];
}

class RecommendationTvInitial extends RecommendationTvState {}

class RecommendationTvLoading extends RecommendationTvState {
  @override
  List<Object> get props => <Object>[];
}

class RecommendationTvLoaded extends RecommendationTvState {
  final List<Tv> tvShows;
  RecommendationTvLoaded({required this.tvShows});
  @override
  List<Object> get props => <Object>[tvShows];
}

class RecommendationTvError extends RecommendationTvState {
  final String message;
  RecommendationTvError({required this.message});
  @override
  List<Object> get props => <Object>[message];
}
