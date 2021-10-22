import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/tv.dart';
import '../../../domain/usecases/get_top_rated_tv.dart';

part 'top_rated_tv_event.dart';
part 'top_rated_tv_state.dart';

class TopRatedTvBloc extends Bloc<TopRatedTvEvent, TopRatedTvState> {
  final GetTopRatedTv topRatedTvUseCase;

  TopRatedTvBloc({required this.topRatedTvUseCase})
      : super(TopRatedTvInitial()) {
    on<GetTopRatedTvEvent>(_onTopRatedTvEvent);
  }

  void _onTopRatedTvEvent(
      GetTopRatedTvEvent event, Emitter<TopRatedTvState> emit) async {
    emit(TopRatedTvLoading());
    final failureOrTopRatedTv = await topRatedTvUseCase(NoParams());
    failureOrTopRatedTv.fold(
      (failure) => emit(
        TopRatedTvError(message: kErrorMessage),
      ),
      (tvShows) => emit(
        TopRatedTvLoaded(tvShows: tvShows),
      ),
    );
  }
}
