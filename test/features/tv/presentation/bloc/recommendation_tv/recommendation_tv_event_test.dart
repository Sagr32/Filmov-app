import 'package:filmov/features/tv/presentation/bloc/recommendation_tv/recommendation_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecommendationTv event', () {
    final tTvShowId = "123";
    test('supports value comparison', () {
      expect(
          GetRecommendationTvEvent(
            tvShow: tTvShowId,
          ),
          GetRecommendationTvEvent(
            tvShow: tTvShowId,
          ));
    });
  });
}
