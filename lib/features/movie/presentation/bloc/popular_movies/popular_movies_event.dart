part of 'popular_movies_bloc.dart';

@immutable
abstract class PopularMoviesEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

// class GetMoviesForPopular extends PopularMoviesEvent {}

// class PopularEvent extends PopularMoviesEvent {}

class GetMoviesForPopular extends PopularMoviesEvent {}