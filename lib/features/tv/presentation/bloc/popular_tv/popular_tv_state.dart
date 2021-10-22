part of 'popular_tv_bloc.dart';

abstract class PopularTvState extends Equatable {
  const PopularTvState();

  @override
  List<Object> get props => <Object>[];
}

class PopularTvInitial extends PopularTvState {}

class PopularTvLoading extends PopularTvState {
  @override
  List<Object> get props => <Object>[];
}

class PopularTvLoaded extends PopularTvState {
  final List<Tv> tvShows;
  PopularTvLoaded({required this.tvShows});
  @override
  List<Object> get props => <Object>[tvShows];
}

class PopularTvError extends PopularTvState {
  final String message;
  PopularTvError({required this.message});
  @override
  List<Object> get props => <Object>[message];
}
