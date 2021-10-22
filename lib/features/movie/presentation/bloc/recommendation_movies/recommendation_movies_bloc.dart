import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_recommendation_movies.dart';

part 'recommendation_movies_event.dart';
part 'recommendation_movies_state.dart';

class RecommendationMoviesBloc
    extends Bloc<RecommendationMoviesEvent, RecommendationMoviesState> {
  final GetRecommendationMovies recommendationUseCase;

  RecommendationMoviesBloc({required this.recommendationUseCase})
      : super(RecommendationMoviesInitial()) {
    on<GetMoviesForRecommendation>(_onRecommendationEvent);
  }

  void _onRecommendationEvent(GetMoviesForRecommendation event,
      Emitter<RecommendationMoviesState> emit) async {
    emit(RecommendationMoviesLoading());
    final failureOrRecommendationMoviess =
        await recommendationUseCase(Params(event.movieId));
    failureOrRecommendationMoviess.fold(
      (failure) => emit(
        RecommendationMoviesError(message: kErrorMessage),
      ),
      (movies) => emit(
        RecommendationMoviesLoaded(movies: movies),
      ),
    );
  }
}
