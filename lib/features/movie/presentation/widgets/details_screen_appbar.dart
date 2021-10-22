import 'package:flutter/material.dart';

import '../../../../core/utils/screen_arguments.dart';
import '../../../../core/utils/size_config.dart';
import 'background_poster_image.dart';
import 'floating_semi_oval.dart';

/// Sliver App Bar for details screen
/// that contains backgroung image and semi-oval widget
class DetailsScreenAppBar extends StatelessWidget {
  /// Constructor
  const DetailsScreenAppBar({Key? key, required this.argument})
      : super(key: key);

  /// Custom class that hold all arguments that
  /// passes to details screen
  final ScreenArguments argument;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      expandedHeight: SizeConfig.blockSizeVertical * 50,
      snap: false,
      pinned: false,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, SizeConfig.blockSizeVertical * 40),
        child: FloatingSemiOvalWidget(
          voteAverage: argument.voteAverage.toDouble(),
          popularity: argument.popularity.toDouble(),
          releaseDate: argument.releaseDate,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: <Widget>[
            BackgroundPosterImage(imagePath: argument.backdropPath),
          ],
        ),
      ),
    );
  }
}
