part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetMoviesForSearch extends SearchMoviesEvent {
  final String query;
  GetMoviesForSearch({required this.query});
  @override
  List<Object> get props => <Object>[query];
}
