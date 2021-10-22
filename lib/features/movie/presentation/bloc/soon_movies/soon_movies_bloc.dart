import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_soon_movies.dart';

part 'soon_movies_event.dart';
part 'soon_movies_state.dart';

class SoonMoviesBloc extends Bloc<SoonMoviesEvent, SoonMoviesState> {
  final GetSoonMovies soonUseCase;

  SoonMoviesBloc({required this.soonUseCase}) : super(SoonMoviesInitial()) {
    on<GetMoviesForSoon>(_onSoonEvent);
  }

  void _onSoonEvent(
      GetMoviesForSoon event, Emitter<SoonMoviesState> emit) async {
    emit(SoonMoviesLoading());
    final failureOrSoonMoviess = await soonUseCase(NoParams());
    failureOrSoonMoviess.fold(
      (failure) => emit(
        SoonMoviesError(message: kErrorMessage),
      ),
      (movies) => emit(
        SoonMoviesLoaded(movies: movies),
      ),
    );
  }
}
