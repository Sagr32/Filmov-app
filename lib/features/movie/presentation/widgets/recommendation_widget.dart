import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/artwork_card.dart';
import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';
import '../../../../core/utils/screen_arguments.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../injection_container.dart';
import '../bloc/recommendation_movies/recommendation_movies_bloc.dart';

/// widget that holds Recommendation Movies
/// for a specific movie
class RecommendationWidget extends StatelessWidget {
  /// constructor
  const RecommendationWidget({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  /// movie id
  final String movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecommendationMoviesBloc>(
      create: (_) => sl<RecommendationMoviesBloc>()
        ..add(GetMoviesForRecommendation(
          movieId: movieId,
        )),
      child: Column(
        children: <Widget>[
          BlocBuilder<RecommendationMoviesBloc, RecommendationMoviesState>(
            builder: (BuildContext context, RecommendationMoviesState state) {
              if (state is RecommendationMoviesLoading) {
                return LoadingWidget(
                  height: SizeConfig.blockSizeVertical * 35,
                  width: double.infinity,
                );
              } else if (state is RecommendationMoviesLoaded) {
                return SizedBox(
                  height: SizeConfig.blockSizeVertical * 35,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index) {
                      return SizedBox(
                        height: SizeConfig.blockSizeVertical * 35,
                        child: ArtWorkCard(
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
                        ),
                      );
                    },
                  ),
                );
              } else if (state is RecommendationMoviesError) {
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
