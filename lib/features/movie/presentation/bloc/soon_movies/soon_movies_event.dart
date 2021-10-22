part of 'soon_movies_bloc.dart';

abstract class SoonMoviesEvent extends Equatable {
  const SoonMoviesEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetMoviesForSoon extends SoonMoviesEvent {
  @override
  List<Object> get props => <Object>[];
}
