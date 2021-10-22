import 'package:filmov/features/Credits/domain/entities/credit.dart';
import 'package:filmov/features/Credits/presentation/bloc/movie_credit/movie_credit_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeCredit extends Fake implements Credit {}

void main() {
  group('MovieCreditState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(MovieCreditLoading(), MovieCreditLoading());
      });
    });

    group('Loaded', () {
      final credit = FakeCredit();

      test('supports value comparison', () {
        expect(
          MovieCreditLoaded(credit: credit),
          MovieCreditLoaded(credit: credit),
        );
      });
    });

    group('MovieCreditError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(MovieCreditError(message: errorMessage),
            MovieCreditError(message: errorMessage));
      });
    });
  });
}
