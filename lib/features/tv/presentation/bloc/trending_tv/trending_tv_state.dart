part of 'trending_tv_bloc.dart';

abstract class TrendingTvState extends Equatable {
  const TrendingTvState();

  @override
  List<Object> get props => <Object>[];
}

class TrendingTvInitial extends TrendingTvState {}

class TrendingTvLoading extends TrendingTvState {
  @override
  List<Object> get props => <Object>[];
}

class TrendingTvLoaded extends TrendingTvState {
  final List<Tv> tvShows;
  TrendingTvLoaded({required this.tvShows});
  @override
  List<Object> get props => <Object>[tvShows];
}

class TrendingTvError extends TrendingTvState {
  final String message;
  TrendingTvError({required this.message});
  @override
  List<Object> get props => <Object>[message];
}
