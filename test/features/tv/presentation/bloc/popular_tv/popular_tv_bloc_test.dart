import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/core/usecase/usecase.dart';
import 'package:filmov/features/tv/domain/usecases/get_trending_tv.dart';
import 'package:filmov/features/tv/presentation/bloc/trending_tv/trending_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../test_constants.dart';

class MockGetTrendingTv extends Mock implements GetTrendingTv {}

void main() {
  late MockGetTrendingTv mockGetTrendingTv;
  late TrendingTvBloc bloc;

  setUp(() {
    EquatableConfig.stringify = true;

    mockGetTrendingTv = MockGetTrendingTv();

    bloc = TrendingTvBloc(trendingTvUseCase: mockGetTrendingTv);
  });

  test('PopularInitialState should be Initial', () {
    expect(
        bloc.state,
        equals(
          TrendingTvInitial(),
        ));
  });

  group(
    "GetPopularTv",
    () {
      test(
        'should get data from get Popular use case',
        () async {
          // arrange
          when(() => mockGetTrendingTv(NoParams()))
              .thenAnswer((_) async => Right(tTvEntity));

          // act
          bloc.add(GetTrendingTvEvent());
          await untilCalled(() => mockGetTrendingTv(NoParams()));
          // assert
          verify(() => mockGetTrendingTv(NoParams()));
        },
      );

      blocTest<TrendingTvBloc, TrendingTvState>(
        'should emits [Loading, Loaded] when Popular Tvs is loaded successfully',
        setUp: () {
          when(() => mockGetTrendingTv(NoParams()))
              .thenAnswer((_) async => Right(tTvEntity));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetTrendingTvEvent()),
        expect: () => <TrendingTvState>[
          TrendingTvLoading(),
          TrendingTvLoaded(tvShows: tTvEntity),
        ],
        verify: (_) => verify(() => mockGetTrendingTv(NoParams())).called(1),
      );
      blocTest<TrendingTvBloc, TrendingTvState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetTrendingTv(NoParams()))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetTrendingTvEvent()),
        expect: () => <TrendingTvState>[
          TrendingTvLoading(),
          TrendingTvError(message: kErrorMessage),
        ],
        verify: (_) => verify(() => mockGetTrendingTv(NoParams())).called(1),
      );
    },
  );
}
