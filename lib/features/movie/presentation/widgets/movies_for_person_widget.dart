import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';

import '../../../../core/utils/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/shared/artwork_card.dart';
import '../bloc/movies_for_person/movies_for_person_bloc.dart';

/// widget that contains all movies for specific
/// person or actor
class MoviesForPersonWidget extends StatelessWidget {
  /// Constructor
  const MoviesForPersonWidget({
    Key? key,
    required this.personId,
  }) : super(key: key);

  /// person or actor id
  final String personId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesForPersonBloc>(
      create: (_) => sl<MoviesForPersonBloc>()
        ..add(GetMoviesForPersonEvent(personId: personId)),
      child: Column(
        children: <Widget>[
          BlocBuilder<MoviesForPersonBloc, MoviesForPersonState>(
            builder: (BuildContext context, MoviesForPersonState state) {
              if (state is MoviesForPersonLoading) {
                return LoadingWidget(
                     height: SizeConfig.blockSizeVertical * 35,
                  width: double.infinity,
                );
              } else if (state is MoviesForPersonLoaded) {
                return SizedBox(
                  height: SizeConfig.blockSizeVertical * 35,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movies.length,
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
              } else if (state is MoviesForPersonError) {
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
