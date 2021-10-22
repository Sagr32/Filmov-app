import 'package:filmov/features/tv/domain/entities/tv.dart';
import 'package:filmov/features/tv/presentation/bloc/popular_tv/popular_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeTvShow extends Fake implements Tv {}

void main() {
  group('PopularTvState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(PopularTvLoading(), PopularTvLoading());
      });
    });

    group('Loaded', () {
      final tvShow = FakeTvShow();
      final list = [tvShow];
      test('supports value comparison', () {
        expect(
          PopularTvLoaded(tvShows: list),
          PopularTvLoaded(tvShows: list),
        );
      });
    });

    group('PopularTvError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(PopularTvError(message: errorMessage),
            PopularTvError(message: errorMessage));
      });
    });
  });
}
