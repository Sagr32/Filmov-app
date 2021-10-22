

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/search_movies.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchUseCase;

  SearchMoviesBloc({required this.searchUseCase})
      : super(SearchMoviesInitial()) {
    on<GetMoviesForSearch>(_onSearchEvent);
  }

  void _onSearchEvent(
      GetMoviesForSearch event, Emitter<SearchMoviesState> emit) async {
    emit(SearchMoviesLoading());
    final failureOrSearchMoviess = await searchUseCase(Params(event.query));
    failureOrSearchMoviess.fold(
      (failure) => emit(
        SearchMoviesError(message: kErrorMessage),
      ),
      (movies) => emit(
        SearchMoviesLoaded(movies: movies),
      ),
    );
  }
}
