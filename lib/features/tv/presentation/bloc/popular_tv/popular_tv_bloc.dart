import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/tv.dart';
import '../../../domain/usecases/get_popular_tv.dart';

part 'popular_tv_event.dart';
part 'popular_tv_state.dart';

class PopularTvBloc extends Bloc<PopularTvEvent, PopularTvState> {
  final GetPopularTv popularTvUseCase;

  PopularTvBloc({required this.popularTvUseCase}) : super(PopularTvInitial()) {
    on<GetPopularTvEvent>(_onPopularTvEvent);
  }

  void _onPopularTvEvent(
      GetPopularTvEvent event, Emitter<PopularTvState> emit) async {
    emit(PopularTvLoading());
    final failureOrPopularTv = await popularTvUseCase(NoParams());
    failureOrPopularTv.fold(
        (failure) => emit(
              PopularTvError(message: kErrorMessage),
            ), (tvShows) {
      emit(
        PopularTvLoaded(tvShows: tvShows),
      );
    });
  }
}
