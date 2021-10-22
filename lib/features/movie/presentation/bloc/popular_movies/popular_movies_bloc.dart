import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_popular_movies.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies popularUseCase;

  PopularMoviesBloc({
    required this.popularUseCase,
  }) : super(PopularMoviesInitial());

  @override
  Stream<PopularMoviesState> mapEventToState(
    PopularMoviesEvent event,
  ) async* {
    if (event is GetMoviesForPopular) {
      yield Loading();
      final failureOrTrivia = await popularUseCase(NoParams());
      yield failureOrTrivia.fold(
        (failure) => Error(message: kErrorMessage),
        (movies) => Loaded(movies: movies),
      );
    }
  }
}
