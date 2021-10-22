import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/features/tv/domain/usecases/get_recommendation_tv.dart';
import 'package:filmov/features/tv/presentation/bloc/recommendation_tv/recommendation_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../test_constants.dart';

class MockGetRecommendationTv extends Mock implements GetRecommendationTv {}

void main() {
  late MockGetRecommendationTv mockGetRecommendationTv;
  late RecommendationTvBloc bloc;
  final tTvShowId = "123";

  
  setUp(() {
    EquatableConfig.stringify = true;

    mockGetRecommendationTv = MockGetRecommendationTv();

    bloc =
        RecommendationTvBloc(recommendationTvUseCase: mockGetRecommendationTv);
  });

  test('PopularInitialState should be Initial', () {
    expect(
        bloc.state,
        equals(
          RecommendationTvInitial(),
        ));
  });

  group(
    "GetPopularTv",
    () {
      test(
        'should get data from get Popular use case',
        () async {
          // arrange
          when(() => mockGetRecommendationTv(Params(tTvShowId)))
              .thenAnswer((_) async => Right(tTvEntity));

          // act
          bloc.add(GetRecommendationTvEvent(tvShow: tTvShowId));
          await untilCalled(() => mockGetRecommendationTv(Params(tTvShowId)));
          // assert
          verify(() => mockGetRecommendationTv(Params(tTvShowId)));
        },
      );

      blocTest<RecommendationTvBloc, RecommendationTvState>(
        'should emits [Loading, Loaded] when Popular Tvs is loaded successfully',
        setUp: () {
          when(() => mockGetRecommendationTv(Params(tTvShowId)))
              .thenAnswer((_) async => Right(tTvEntity));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetRecommendationTvEvent(tvShow: tTvShowId)),
        expect: () => <RecommendationTvState>[
          RecommendationTvLoading(),
          RecommendationTvLoaded(tvShows: tTvEntity),
        ],
        verify: (_) =>
            verify(() => mockGetRecommendationTv(Params(tTvShowId))).called(1),
      );
      blocTest<RecommendationTvBloc, RecommendationTvState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetRecommendationTv(Params(tTvShowId)))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetRecommendationTvEvent(tvShow: tTvShowId)),
        expect: () => <RecommendationTvState>[
          RecommendationTvLoading(),
          RecommendationTvError(message: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockGetRecommendationTv(Params(tTvShowId))).called(1),
      );
    },
  );
}
