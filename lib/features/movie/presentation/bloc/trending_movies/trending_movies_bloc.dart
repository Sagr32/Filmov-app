import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_trending_movies.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies trendingUseCase;

  TrendingMoviesBloc({
    required this.trendingUseCase,
  }) : super(TrendingMoviesInitial()) {
    on<GetMoviesForTrending>(_onTrendingEvent);
  }

  void _onTrendingEvent(
      GetMoviesForTrending event, Emitter<TrendingMoviesState> emit) async {
    emit(TrendingMoviesLoading());
    final failureOrTrendingMoviess = await trendingUseCase(NoParams());
    failureOrTrendingMoviess.fold(
      (failure) => emit(
        TrendingMoviesError(message: kErrorMessage),
      ),
      (movies) => emit(
        TrendingMoviesLoaded(movies: movies),
      ),
    );
  }
}
