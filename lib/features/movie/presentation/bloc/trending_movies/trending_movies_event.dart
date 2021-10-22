part of 'trending_movies_bloc.dart';

abstract class TrendingMoviesEvent extends Equatable {
  const TrendingMoviesEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetMoviesForTrending extends TrendingMoviesEvent {
  @override
  List<Object> get props => <Object>[];
}
