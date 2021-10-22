import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/cached_image_widget.dart';
import '../../../../core/utils/screen_arguments.dart';
import '../../../../core/shared/details_screen.dart';
import '../../../../injection_container.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/popular_tv/popular_tv_bloc.dart';

/// widget that represent popular Tv as a carousel slider
class PopularTvWidget extends StatelessWidget {
  /// default constructor
  const PopularTvWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularTvBloc>(
      create: (_) => sl<PopularTvBloc>()..add(GetPopularTvEvent()),
      child: Column(
        children: <Widget>[
          BlocBuilder<PopularTvBloc, PopularTvState>(
            builder: (BuildContext context, PopularTvState state) {
              if (state is PopularTvLoading) {
                return LoadingWidget(
                    height: SizeConfig.blockSizeVertical * 30,
                    width: double.infinity,
                );
              } else if (state is PopularTvLoaded) {
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
                          title: state.tvShows[itemIndex].name,
                          backdropPath: state.tvShows[itemIndex].backdropPath,
                          genreIds: state.tvShows[itemIndex].genreIds,
                          overview: state.tvShows[itemIndex].overview,
                          popularity: state.tvShows[itemIndex].popularity,
                          posterPath: state.tvShows[itemIndex].posterPath,
                          voteAverage: state.tvShows[itemIndex].voteAverage,
                          releaseDate: state.tvShows[itemIndex].firstAirDate,
                          isMovie: false,
                          id: state.tvShows[itemIndex].id,
                        ),
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        CachedImageWidget(
                          imageUrl: state.tvShows[itemIndex].backdropPath,
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
                                  state.tvShows[itemIndex].name,
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
              } else if (state is PopularTvError) {
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
