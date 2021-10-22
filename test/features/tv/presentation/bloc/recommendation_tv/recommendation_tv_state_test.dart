import 'package:filmov/features/tv/domain/entities/tv.dart';
import 'package:filmov/features/tv/presentation/bloc/recommendation_tv/recommendation_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeTvShow extends Fake implements Tv {}

void main() {
  group('RecommendationTvState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(RecommendationTvLoading(), RecommendationTvLoading());
      });
    });

    group('Loaded', () {
      final tvShow = FakeTvShow();
      final list = [tvShow];
      test('supports value comparison', () {
        expect(
          RecommendationTvLoaded(tvShows:  list),
          RecommendationTvLoaded(tvShows: list),
        );
      });
    });

    group('RecommendationTvError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(RecommendationTvError(message: errorMessage),
            RecommendationTvError(message: errorMessage));
      });
    });
  });
}
