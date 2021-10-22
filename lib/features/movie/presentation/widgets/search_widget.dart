import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';

import '../../../../core/utils/screen_arguments.dart';

import '../../../../core/shared/artwork_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/search_movies/search_movies_bloc.dart';

/// widget that hold movies when user
/// search with query
class SearchWidget extends StatelessWidget {
  /// Constructor
  const SearchWidget({Key? key, required this.query}) : super(key: key);

  /// search query
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchMoviesBloc>(
      create: (_) =>
          sl<SearchMoviesBloc>()..add(GetMoviesForSearch(query: query)),
      child: Column(
        children: <Widget>[
          BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
            builder: (BuildContext context, SearchMoviesState state) {
              if (state is SearchMoviesInitial) {
                return const MessageDisplay(
                  message: 'Start searching!',
                );
              } else if (state is SearchMoviesLoading) {
                return LoadingWidget(
                  height: SizeConfig.blockSizeVertical * 40,
                  width: double.infinity,
                );
              } else if (state is SearchMoviesLoaded) {
                return SizedBox(
                  height: SizeConfig.blockSizeVertical * 40,
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
              } else if (state is SearchMoviesError) {
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
