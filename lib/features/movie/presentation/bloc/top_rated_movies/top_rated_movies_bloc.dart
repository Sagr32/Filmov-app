import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';

import '../../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_top_rated_movies.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMovies topRatedUseCase;

  TopRatedMoviesBloc({required this.topRatedUseCase})
      : super(TopRatedMoviesInitial()) {
    on<GetMoviesForTopRated>(_onTopRatedEvent);
  }

  void _onTopRatedEvent(
      GetMoviesForTopRated event, Emitter<TopRatedMoviesState> emit) async {
    emit(TopRatedMoviesLoading());
    final failureOrTopRatedMoviess = await topRatedUseCase(NoParams());
    failureOrTopRatedMoviess.fold(
      (failure) => emit(
        TopRatedMoviesError(message: kErrorMessage),
      ),
      (movies) => emit(
        TopRatedMoviesLoaded(movies: movies),
      ),
    );
  }
}
