import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/tv.dart';
import '../../../domain/usecases/get_trending_tv.dart';

part 'trending_tv_event.dart';
part 'trending_tv_state.dart';

class TrendingTvBloc extends Bloc<TrendingTvEvent, TrendingTvState> {
  final GetTrendingTv trendingTvUseCase;

  TrendingTvBloc({required this.trendingTvUseCase})
      : super(TrendingTvInitial()) {
    on<GetTrendingTvEvent>(_onTrendingTvEvent);
  }

  void _onTrendingTvEvent(
      GetTrendingTvEvent event, Emitter<TrendingTvState> emit) async {
    emit(TrendingTvLoading());
    final failureOrTrendingTv = await trendingTvUseCase(NoParams());
    failureOrTrendingTv.fold(
      (failure) => emit(
        TrendingTvError(message: kErrorMessage),
      ),
      (tvSows) => emit(
        TrendingTvLoaded(tvShows: tvSows),
      ),
    );
  }
}
