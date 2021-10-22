import 'package:filmov/features/tv/presentation/bloc/popular_tv/popular_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PopularTv event', () {
    test('supports value comparison', () {
      expect(GetPopularTvEvent(), GetPopularTvEvent());
    });
  });
}
