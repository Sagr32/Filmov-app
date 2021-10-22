part of 'recommendation_tv_bloc.dart';

abstract class RecommendationTvEvent extends Equatable {
  const RecommendationTvEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetRecommendationTvEvent extends RecommendationTvEvent {
  final String tvShow;
  GetRecommendationTvEvent({required this.tvShow});

  @override
  List<Object> get props => <Object>[tvShow];
}
