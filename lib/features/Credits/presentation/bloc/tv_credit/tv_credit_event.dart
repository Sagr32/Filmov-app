part of 'tv_credit_bloc.dart';

/// Abstract class for bloc event
abstract class TvCreditEvent extends Equatable {
  /// Constructor
  const TvCreditEvent();

  @override
  List<Object> get props => <Object>[];
}

/// get tv credit event
class GetTvCreditEvent extends TvCreditEvent {
  /// Constructor
  const GetTvCreditEvent({required this.tvShowId});

  /// target tv show
  final String tvShowId;

  @override
  List<Object> get props => <Object>[tvShowId];
}
