part of 'movie_credit_bloc.dart';


/// abstract event class for movie credit
abstract class MovieCreditEvent extends Equatable {
  /// Constructor
  const MovieCreditEvent();

  @override
  List<Object> get props => <Object>[];
}

/// event that dispatch from ui to get movie credit
class GetMovieCreditEvent extends MovieCreditEvent {
  /// Constructor
  const GetMovieCreditEvent({required this.movieId});
  /// target movie id
  final String movieId;

  @override
  List<Object> get props => <Object>[movieId];
}
