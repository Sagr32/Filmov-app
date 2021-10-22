import 'package:filmov/features/tv/domain/entities/tv.dart';
import 'package:filmov/features/tv/presentation/bloc/top_rated_tv/top_rated_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeTvShow extends Fake implements Tv {}

void main() {
  group('TopRatedTvState', () {
    group('Loading', () {
      test('supports value comparison', () {
        expect(TopRatedTvLoading(), TopRatedTvLoading());
      });
    });

    group('Loaded', () {
      final tvShow = FakeTvShow();
      final list = [tvShow];
      test('supports value comparison', () {
        expect(
          TopRatedTvLoaded(tvShows:list),
          TopRatedTvLoaded(tvShows: list),
        );
      });
    });

    group('TopRatedTvError', () {
      final errorMessage = "error";
      test('supports value comparison', () {
        expect(TopRatedTvError(message: errorMessage),
            TopRatedTvError(message: errorMessage));
      });
    });
  });
}
