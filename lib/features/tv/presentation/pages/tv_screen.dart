import '../../../../core/constant/constants.dart';
import '../../../../core/shared/custom_label.dart';
import '../widgets/top_rated_tv_widget.dart';
import '../widgets/trending_tv_widget.dart';

import '../widgets/popular_tv.dart';
import 'package:flutter/material.dart';

/// Tv screen that hold all tv widgets
class TvScreen extends StatelessWidget {
  /// Constructor
  const TvScreen({Key? key}) : super(key: key);

  /// route name
  static const String routeName = '/tv-screen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          // MovieCreditWidget(
          //   movieId: '550988',
          // ),
          PopularTvWidget(),
          CustomLabel(
            title: kTrendingTv,
            padding: EdgeInsets.all(4.0),
          ),
          TrendingTvWidget(),
          CustomLabel(
            title: kTopRatedTv,
            padding: EdgeInsets.all(4.0),
          ),
          TopRatedTvWidget(),
        ],
      ),
    );
  }
}
