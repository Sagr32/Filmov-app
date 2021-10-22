part of 'top_rated_tv_bloc.dart';

abstract class TopRatedTvState extends Equatable {
  const TopRatedTvState();

  @override
  List<Object> get props => <Object>[];
}

class TopRatedTvInitial extends TopRatedTvState {}

class TopRatedTvLoading extends TopRatedTvState {
  @override
  List<Object> get props => <Object>[];
}

class TopRatedTvLoaded extends TopRatedTvState {
  final List<Tv> tvShows;
  TopRatedTvLoaded({required this.tvShows});
  @override
  List<Object> get props => <Object>[tvShows];
}

class TopRatedTvError extends TopRatedTvState {
  final String message;
  TopRatedTvError({required this.message});
  @override
  List<Object> get props => <Object>[message];
}
