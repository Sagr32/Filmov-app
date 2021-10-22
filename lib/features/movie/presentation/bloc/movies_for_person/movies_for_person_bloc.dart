import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_movies_for_person.dart';

part 'movies_for_person_event.dart';
part 'movies_for_person_state.dart';

class MoviesForPersonBloc
    extends Bloc<MoviesForPersonEvent, MoviesForPersonState> {
  final GetMoviesForPerson moviesForPersonUseCase;

  MoviesForPersonBloc({required this.moviesForPersonUseCase})
      : super(MoviesForPersonInitial()) {
    on<GetMoviesForPersonEvent>(_onMoviesForPersonEvent);
  }

  void _onMoviesForPersonEvent(
      GetMoviesForPersonEvent event, Emitter<MoviesForPersonState> emit) async {
    emit(MoviesForPersonLoading());
    final failureOrMoviesForPerson =
        await moviesForPersonUseCase(Params(event.personId));
    failureOrMoviesForPerson.fold(
      (failure) => emit(
        MoviesForPersonError(message: kErrorMessage),
      ),
      (movies) => emit(
        MoviesForPersonLoaded(movies: movies),
      ),
    );
  }
}
