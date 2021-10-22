import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';
import '../../../../../core/error/failure.dart';

import '../../../domain/entities/credit.dart';
import '../../../domain/usecases/get_movie_credits.dart';

part 'movie_credit_event.dart';
part 'movie_credit_state.dart';

/// Bloc for Movie credit that includes cast and crew data
class MovieCreditBloc extends Bloc<MovieCreditEvent, MovieCreditState> {
  /// Constructor
  MovieCreditBloc({required this.movieCreditUseCase})
      : super(MovieCreditInitial()) {
    on<GetMovieCreditEvent>(_onMovieCreditEvent);
  }

  /// movie credit use case
  final GetMovieCredit movieCreditUseCase;

  /// method that fires when receiveing
  /// movie credit event
  void _onMovieCreditEvent(
      GetMovieCreditEvent event, Emitter<MovieCreditState> emit) async {
    emit(MovieCreditLoading());
    final Either<Failure, Credit> failureOrMovieCredit =
        await movieCreditUseCase(Params(event.movieId));
    failureOrMovieCredit.fold(
      (Failure failure) => emit(
        MovieCreditError(message: kErrorMessage),
      ),
      (Credit credit) => emit(
        MovieCreditLoaded(credit: credit),
      ),
    );
  }
}
