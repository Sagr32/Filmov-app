import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/artwork_card.dart';
import '../../../../core/utils/screen_arguments.dart';
import '../../../../injection_container.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/top_rated_movies/top_rated_movies_bloc.dart';

/// Widget for Top Rated Movies
class TopRatedWidget extends StatefulWidget {
  /// Default constructor
  const TopRatedWidget({Key? key}) : super(key: key);

  @override
  State<TopRatedWidget> createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopRatedMoviesBloc>(
      create: (_) => sl<TopRatedMoviesBloc>()..add(GetMoviesForTopRated()),
      child: Center(
        child: Column(
          children: <Widget>[
            BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
              builder: (BuildContext context, TopRatedMoviesState state) {
                if (state is TopRatedMoviesLoading) {
                  return LoadingWidget(
                       height: SizeConfig.blockSizeVertical * 35,
                    width: double.infinity,
                  );
                } else if (state is TopRatedMoviesLoaded) {
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
                } else if (state is TopRatedMoviesError) {
                  return MessageDisplay(
                    message: state.message,
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
