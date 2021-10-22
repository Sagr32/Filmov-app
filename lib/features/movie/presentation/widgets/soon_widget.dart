import '../../../../core/shared/message_display.dart';

import '../../../../core/utils/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/artwork_card.dart';
import '../../../../injection_container.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/soon_movies/soon_movies_bloc.dart';

/// widget that holds soon movies
class SoonWidget extends StatelessWidget {
  /// Constructor
  const SoonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SoonMoviesBloc>(
      create: (_) => sl<SoonMoviesBloc>()..add(GetMoviesForSoon()),
      child: Column(
        children: <Widget>[
          BlocBuilder<SoonMoviesBloc, SoonMoviesState>(
            builder: (BuildContext context, SoonMoviesState state) {
              if (state is SoonMoviesLoaded) {
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
              } else if (state is SoonMoviesError) {
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
