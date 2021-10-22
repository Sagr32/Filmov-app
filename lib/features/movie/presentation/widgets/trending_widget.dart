import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';

import '../../../../core/shared/artwork_card.dart';
import '../../../../core/utils/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/trending_movies/trending_movies_bloc.dart';

/// Widget that shows trending movies
class TrendingWidget extends StatelessWidget {
  /// Constructor

  const TrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrendingMoviesBloc>(
      create: (_) => sl<TrendingMoviesBloc>()..add(GetMoviesForTrending()),
      child: Column(
        children: <Widget>[
          BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
            builder: (BuildContext context, TrendingMoviesState state) {
              if (state is TrendingMoviesLoading) {
                return LoadingWidget(
                  height: SizeConfig.blockSizeVertical * 35,
                  width: double.infinity,
                );
              } else if (state is TrendingMoviesLoaded) {
                return SizedBox(
                  height: SizeConfig.blockSizeVertical * 35,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ArtWorkCard(
                        argument: ScreenArguments(
                          id: state.movies[index].id,
                          backdropPath: state.movies[index].backdropPath,
                          genreIds: state.movies[index].genreIds,
                          overview: state.movies[index].overview,
                          popularity: state.movies[index].popularity,
                          posterPath: state.movies[index].posterPath,
                          releaseDate: state.movies[index].releaseDate,
                          title: state.movies[index].title,
                          voteAverage: state.movies[index].voteAverage,
                          isMovie: true,
                        ),
                      );
                    },
                  ),
                );
              } else if (state is TrendingMoviesError) {
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
