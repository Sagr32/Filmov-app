import '../../features/Credits/presentation/widgets/movie_credit_widget.dart';
import '../../features/Credits/presentation/widgets/tv_credit_widget.dart';
import '../../features/tv/presentation/widgets/recommendation_tv_widget.dart';
import 'package:flutter/material.dart';

import '../utils/screen_arguments.dart';
import 'genres_widget.dart';
import '../../features/movie/presentation/widgets/details_screen_appbar.dart';
import '../../features/movie/presentation/widgets/recommendation_widget.dart';

/// Details Screen that contains details about
/// movie or tv (ArtWork)
class DetailsScreen extends StatelessWidget {
  /// Constructor
  const DetailsScreen({Key? key}) : super(key: key);

  /// route name
  static const String routeName = '/details-screen';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments argument =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              DetailsScreenAppBar(
                argument: argument,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            argument.title,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GenresWidget(
                            genreIds: argument.genreIds,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Overview',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            argument.overview,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          argument.isMovie
                              ? MovieCreditWidget(
                                  movieId: argument.id.toString(),
                                )
                              : TvCreditWidget(
                                  tvShowId: argument.id.toString(),
                                ),
                          Text('Recommendation',
                              style: Theme.of(context).textTheme.subtitle1),
                        ],
                      ),
                    ),
                    argument.isMovie
                        ? RecommendationWidget(
                            movieId: argument.id.toString(),
                          )
                        : RecommendationTvWidget(
                            tvShowId: argument.id.toString(),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
