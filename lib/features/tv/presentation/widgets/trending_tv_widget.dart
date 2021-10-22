import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/artwork_card.dart';
import '../../../../core/utils/screen_arguments.dart';
import '../bloc/trending_tv/trending_tv_bloc.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../injection_container.dart';

/// Widget that shows Trending Tv shows
class TrendingTvWidget extends StatelessWidget {
  /// Constructor
  const TrendingTvWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrendingTvBloc>(
      create: (_) => sl<TrendingTvBloc>()..add(GetTrendingTvEvent()),
      child: Column(
        children: <Widget>[
          BlocBuilder<TrendingTvBloc, TrendingTvState>(
            builder: (BuildContext context, TrendingTvState state) {
              if (state is TrendingTvLoading) {
                return LoadingWidget(
                  height: SizeConfig.blockSizeVertical * 35,
                  width: double.infinity,
                );
              } else if (state is TrendingTvLoaded) {
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
              } else if (state is TrendingTvError) {
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
