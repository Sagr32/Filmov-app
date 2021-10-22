import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';
import '../../../../../core/error/failure.dart';

import '../../../domain/entities/credit.dart';
import '../../../domain/usecases/get_tv_credits.dart';

part 'tv_credit_event.dart';
part 'tv_credit_state.dart';

/// Bloc for Tv Credit
class TvCreditBloc extends Bloc<TvCreditEvent, TvCreditState> {
  /// Constructor
  TvCreditBloc({required this.tvCreditUseCase}) : super(TvCreditInitial()) {
    on<GetTvCreditEvent>(_onTvCreditEvent);
  }

  /// tv credit use case

  final GetTvCredit tvCreditUseCase;

  void _onTvCreditEvent(
      GetTvCreditEvent event, Emitter<TvCreditState> emit) async {
    emit(TvCreditLoading());
    final Either<Failure, Credit> failureOrTvCredit =
        await tvCreditUseCase(Params(event.tvShowId));
    failureOrTvCredit.fold(
      (Failure failure) => emit(
        TvCreditError(message: kErrorMessage),
      ),
      (Credit credit) => emit(
        TvCreditLoaded(credit: credit),
      ),
    );
  }
}
