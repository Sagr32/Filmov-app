import 'package:filmov/features/tv/presentation/bloc/trending_tv/trending_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TrendingTv event', () {
    test('supports value comparison', () {
      expect(GetTrendingTvEvent(), GetTrendingTvEvent());
    });
  });
}
