import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/cached_image_widget.dart';
import '../../../../core/shared/custom_label.dart';
import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../injection_container.dart';
import '../bloc/movie_credit/movie_credit_bloc.dart';
import '../pages/person_details_screen.dart';

/// widget that holds cast and crew information
/// for a specific movie
class MovieCreditWidget extends StatelessWidget {
  /// Constructor
  const MovieCreditWidget({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  /// movie id to get its cast and crew
  final String movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCreditBloc>(
      create: (_) => sl<MovieCreditBloc>()
        ..add(
          GetMovieCreditEvent(
            movieId: movieId,
          ),
        ),
      child: Column(
        children: <Widget>[
          BlocBuilder<MovieCreditBloc, MovieCreditState>(
            builder: (BuildContext context, MovieCreditState state) {
              if (state is MovieCreditLoading) {
                return LoadingWidget(
                  height: SizeConfig.blockSizeVertical * 35,
                  width: double.infinity,
                );
              } else if (state is MovieCreditLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Cast
                    const CustomLabel(
                      title: 'Cast',
                      padding: EdgeInsets.all(4.0),
                    ),
                    state.credit.cast.isEmpty
                        ? const MessageDisplay(message: 'No Available Info')
                        : SizedBox(
                            height: SizeConfig.blockSizeVertical * 20,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.credit.cast.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext ctx, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      PersonDetailsScreen.routeName,
                                      arguments: state.credit.cast[index].id,
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CachedImageWidget(
                                          isCircle: true,
                                          borderRadius: 0,
                                          height:
                                              SizeConfig.blockSizeVertical * 15,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  15,
                                          imageUrl: state
                                              .credit.cast[index].profilePath,
                                          boxFit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        state.credit.cast[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                    // Crew
                    const CustomLabel(
                      title: 'Crew',
                      padding: EdgeInsets.all(4.0),
                    ),
                    state.credit.crew.isEmpty
                        ? const MessageDisplay(message: 'No Available Info')
                        : SizedBox(
                            height: SizeConfig.blockSizeVertical * 20,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.credit.cast.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext ctx, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      PersonDetailsScreen.routeName,
                                      arguments: state.credit.crew[index].id,
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CachedImageWidget(
                                          isCircle: true,
                                          borderRadius: 0,
                                          height:
                                              SizeConfig.blockSizeVertical * 15,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  15,
                                          imageUrl: state
                                              .credit.crew[index].profilePath,
                                          boxFit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        state.credit.crew[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                );
              } else if (state is MovieCreditError) {
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
