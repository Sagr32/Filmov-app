import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';

import '../../../domain/entities/tv.dart';
import '../../../domain/usecases/get_recommendation_tv.dart';

part 'recommendation_tv_event.dart';
part 'recommendation_tv_state.dart';

class RecommendationTvBloc
    extends Bloc<RecommendationTvEvent, RecommendationTvState> {
  final GetRecommendationTv recommendationTvUseCase;

  RecommendationTvBloc({required this.recommendationTvUseCase})
      : super(RecommendationTvInitial()) {
    on<GetRecommendationTvEvent>(_onRecommendationTvEvent);
  }

  void _onRecommendationTvEvent(GetRecommendationTvEvent event,
      Emitter<RecommendationTvState> emit) async {
    emit(RecommendationTvLoading());
    final failureOrRecommendationTv =
        await recommendationTvUseCase(Params(event.tvShow));
    failureOrRecommendationTv.fold(
      (failure) => emit(
        RecommendationTvError(message: kErrorMessage),
      ),
      (tvShows) => emit(
        RecommendationTvLoaded(tvShows: tvShows),
      ),
    );
  }
}
