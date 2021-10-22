part of 'movies_for_person_bloc.dart';

abstract class MoviesForPersonEvent extends Equatable {
  const MoviesForPersonEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetMoviesForPersonEvent extends MoviesForPersonEvent {
  final String personId;
  GetMoviesForPersonEvent({required this.personId});

  @override
  List<Object> get props => <Object>[personId];
}
