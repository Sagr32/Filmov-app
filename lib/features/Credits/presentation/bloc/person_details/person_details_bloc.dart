import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constant/constants.dart';
import '../../../../../core/error/failure.dart';

import '../../../domain/entities/person.dart';
import '../../../domain/usecases/get_person_details.dart';

part 'person_details_event.dart';
part 'person_details_state.dart';

/// Bloc for person details
class PersonDetailsBloc extends Bloc<PersonDetailsEvent, PersonDetailsState> {
  /// Constructor and initial state
  PersonDetailsBloc({required this.personDetailsUseCase})
      : super(PersonDetailsInitial()) {
    on<GetPersonDetailsEvent>(_onPersonDetailsEvent);
  }

  /// person details use case
  final GetPersonDetails personDetailsUseCase;

  /// method that fires when adding
  /// person details event from ui
  void _onPersonDetailsEvent(
      GetPersonDetailsEvent event, Emitter<PersonDetailsState> emit) async {
    emit(PersonDetailsLoading());
    final Either<Failure, Person> failureOrPersonDetails =
        await personDetailsUseCase(Params(event.personId));

    failureOrPersonDetails.fold(
      (Failure failure) => emit(
        PersonDetailsError(message: kErrorMessage),
      ),
      (Person person) => emit(
        PersonDetailsLoaded(person: person),
      ),
    );
  }
}
