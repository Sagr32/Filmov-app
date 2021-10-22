import 'package:filmov/features/tv/presentation/bloc/top_rated_tv/top_rated_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TopRatedTv event', () {
    test('supports value comparison', () {
      expect(GetTopRatedTvEvent(), GetTopRatedTvEvent());
    });
  });
}
