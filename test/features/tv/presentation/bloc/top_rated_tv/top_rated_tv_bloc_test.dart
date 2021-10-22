import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmov/core/error/failure.dart';
import 'package:filmov/core/usecase/usecase.dart';
import 'package:filmov/features/tv/domain/usecases/get_top_rated_tv.dart';
import 'package:filmov/features/tv/presentation/bloc/top_rated_tv/top_rated_tv_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../test_constants.dart';


class MockGetTopRatedTv extends Mock implements GetTopRatedTv {}

void main() {
  late MockGetTopRatedTv mockGetTopRatedTv;
  late TopRatedTvBloc bloc;

  setUp(() {
    EquatableConfig.stringify = true;

    mockGetTopRatedTv = MockGetTopRatedTv();

    bloc = TopRatedTvBloc(topRatedTvUseCase: mockGetTopRatedTv);
  });

  test('PopularInitialState should be Initial', () {
    expect(
        bloc.state,
        equals(
          TopRatedTvInitial(),
        ));
  });

  group(
    "GetPopularTv",
    () {
      test(
        'should get data from get Popular use case',
        () async {
          // arrange
          when(() => mockGetTopRatedTv(NoParams()))
              .thenAnswer((_) async => Right(tTvEntity));

          // act
          bloc.add(GetTopRatedTvEvent());
          await untilCalled(() => mockGetTopRatedTv(NoParams()));
          // assert
          verify(() => mockGetTopRatedTv(NoParams()));
        },
      );

      blocTest<TopRatedTvBloc, TopRatedTvState>(
        'should emits [Loading, Loaded] when Popular Tvs is loaded successfully',
        setUp: () {
          when(() => mockGetTopRatedTv(NoParams()))
              .thenAnswer((_) async => Right(tTvEntity));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetTopRatedTvEvent()),
        expect: () => <TopRatedTvState>[
          TopRatedTvLoading(),
          TopRatedTvLoaded(tvShows: tTvEntity),
        ],
        verify: (_) => verify(() => mockGetTopRatedTv(NoParams())).called(1),
      );
      blocTest<TopRatedTvBloc, TopRatedTvState>(
        'should emits [Loading, Error] when error occurs',
        setUp: () {
          when(() => mockGetTopRatedTv(NoParams()))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetTopRatedTvEvent()),
        expect: () => <TopRatedTvState>[
          TopRatedTvLoading(),
          TopRatedTvError(message: kErrorMessage),
        ],
        verify: (_) => verify(() => mockGetTopRatedTv(NoParams())).called(1),
      );
    },
  );
}
