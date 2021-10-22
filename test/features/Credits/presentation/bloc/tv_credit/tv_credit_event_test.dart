


import 'package:filmov/features/Credits/presentation/bloc/tv_credit/tv_credit_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TvCredit event', () {
    final tTvShowId = "6674";

    test('supports value comparison', () {
      expect(
        GetTvCreditEvent(tvShowId: tTvShowId),
        GetTvCreditEvent(tvShowId:tTvShowId),
      );
    });
  });
}
