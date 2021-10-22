import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';
import '../../../../core/utils/screen_arguments.dart';
import '../../../../core/shared/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/cached_image_widget.dart';
import '../../../../injection_container.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/popular_movies/popular_movies_bloc.dart';

/// widget that represent popular movies as a carousel slider
class PopularMoviesWidget extends StatelessWidget {
  /// default constructor
  const PopularMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularMoviesBloc>(
      create: (_) => sl<PopularMoviesBloc>()..add(GetMoviesForPopular()),
      child: Column(
        children: <Widget>[
          BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
            builder: (BuildContext context, PopularMoviesState state) {
              if (state is Loading) {
                return LoadingWidget(
                  height: SizeConfig.blockSizeVertical * 35,
                  width: double.infinity,
                );
              } else if (state is Loaded) {
                return CarouselSlider.builder(
                  options: CarouselOptions(
                    height: SizeConfig.blockSizeVertical * 30,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    initialPage: 0,
                  ),
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailsScreen.routeName,
                        arguments: ScreenArguments(
                          title: state.movies[itemIndex].title,
                          backdropPath: state.movies[itemIndex].backdropPath,
                          genreIds: state.movies[itemIndex].genreIds,
                          overview: state.movies[itemIndex].overview,
                          popularity: state.movies[itemIndex].popularity,
                          posterPath: state.movies[itemIndex].posterPath,
                          voteAverage: state.movies[itemIndex].voteAverage,
                          releaseDate: state.movies[itemIndex].releaseDate,
                          isMovie: true,
                          id: state.movies[itemIndex].id,
                        ),
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        CachedImageWidget(
                          imageUrl: state.movies[itemIndex].backdropPath,
                          height: SizeConfig.blockSizeVertical * 30,
                          width: double.infinity,
                          boxFit: BoxFit.cover,
                          borderRadius: 0,
                          isCircle: false,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: const <double>[0.0, 0.9],
                              colors: [
                                const Color(0xFF151C26).withOpacity(1.0),
                                const Color(0xFF151C26).withOpacity(0.0)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30.0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            width: SizeConfig.blockSizeHorizontal * 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  state.movies[itemIndex].title,
                                  style: const TextStyle(
                                    height: 1.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is Error) {
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
