import 'package:flutter/material.dart';

import '../../../../core/constant/constants.dart';
import '../../../../core/shared/custom_label.dart';
import '../../../../core/utils/size_config.dart';

import '../widgets/popular_movies_widget.dart';

import '../widgets/soon_widget.dart';
import '../widgets/top_rated_widget.dart';
import '../widgets/trending_widget.dart';

/// Main Screen For Movies
class MovieScreen extends StatefulWidget {
  ///Defaulat constructor
  const MovieScreen({Key? key}) : super(key: key);

  ///route name
  static const String routeName = '/movie-screen';

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            PopularMoviesWidget(),
            SizedBox(
              height: 5,
            ),
            CustomLabel(
              title: kTopRatedMovies,
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
            ),
            TopRatedWidget(),
            CustomLabel(
              title: kTrendingMovies,
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
            ),
            TrendingWidget(),
            CustomLabel(
              title: kSoonMovies,
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
            ),
            SoonWidget(),
          ],
        ),
      ),
    );
  }
}
