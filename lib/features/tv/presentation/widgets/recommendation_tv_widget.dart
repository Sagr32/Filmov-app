import '../../../../core/shared/artwork_card.dart';
import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';
import '../../../../core/utils/screen_arguments.dart';
import '../bloc/recommendation_tv/recommendation_tv_bloc.dart';
import '../../../../core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

/// widget that holds Recommendation Tv
/// for a specific tv show
class RecommendationTvWidget extends StatelessWidget {
  /// Constructor
  const RecommendationTvWidget({
    Key? key,
    required this.tvShowId,
  }) : super(key: key);

  /// tv show id to get recommendation for it
  final String tvShowId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecommendationTvBloc>(
      create: (_) => sl<RecommendationTvBloc>()
        ..add(
          GetRecommendationTvEvent(
            tvShow: tvShowId,
          ),
        ),
      child: Column(
        children: <Widget>[
          BlocBuilder<RecommendationTvBloc, RecommendationTvState>(
            builder: (BuildContext context, RecommendationTvState state) {
              if (state is RecommendationTvLoading) {
                return LoadingWidget(
                  height: SizeConfig.blockSizeVertical * 35,
                  width: double.infinity,
                );
              } else if (state is RecommendationTvLoaded) {
                if (state.tvShows.isEmpty) {
                  return const MessageDisplay(
                    message: 'No Recommendation available',
                  );
                } else {
                  return SizedBox(
                    height: SizeConfig.blockSizeVertical * 35,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.tvShows.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext ctx, int index) {
                        return ArtWorkCard(
                          argument: ScreenArguments(
                            id: state.tvShows[index].id,
                            backdropPath: state.tvShows[index].backdropPath,
                            genreIds: state.tvShows[index].genreIds,
                            overview: state.tvShows[index].overview,
                            popularity: state.tvShows[index].popularity,
                            posterPath: state.tvShows[index].posterPath,
                            releaseDate: state.tvShows[index].firstAirDate,
                            title: state.tvShows[index].name,
                            voteAverage: state.tvShows[index].voteAverage,
                            isMovie: false,
                          ),
                        );
                      },
                    ),
                  );
                }
              } else if (state is RecommendationTvError) {
                return MessageDisplay(
                  message: state.message,
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
