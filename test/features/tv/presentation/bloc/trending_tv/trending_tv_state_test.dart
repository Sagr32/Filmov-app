import 'package:filmov/features/tv/domain/entities/tv.dart';
import 'package:filmov/features/tv/presentation/bloc/trending_tv/trending_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeTvShows extends Fake implements Tv {}

void main() {
  group('TrendingTvState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(TrendingTvLoading(), TrendingTvLoading());
      });
    });

    group('Loaded', () {
      final tvShow = FakeTvShows();
      final list = [tvShow];
      test('supports value comparison', () {
        expect(
          TrendingTvLoaded(tvShows: list),
          TrendingTvLoaded(tvShows: list),
        );
      });
    });

    group('TrendingTvError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(TrendingTvError(message: errorMessage),
            TrendingTvError(message: errorMessage));
      });
    });
  });
}
