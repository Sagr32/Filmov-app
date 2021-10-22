import 'package:filmov/features/Credits/domain/entities/credit.dart';
import 'package:filmov/features/Credits/presentation/bloc/tv_credit/tv_credit_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeCredit extends Fake implements Credit {}

void main() {
  group('TvCreditState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(TvCreditLoading(), TvCreditLoading());
      });
    });

    group('Loaded', () {
      final credit = FakeCredit();

      test('supports value comparison', () {
        expect(
          TvCreditLoaded(credit: credit),
          TvCreditLoaded(credit: credit),
        );
      });
    });

    group('TvCreditError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(TvCreditError(message: errorMessage),
            TvCreditError(message: errorMessage));
      });
    });
  });
}
