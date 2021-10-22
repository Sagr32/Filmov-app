import 'details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'cached_image_widget.dart';
import '../utils/screen_arguments.dart';
import '../utils/size_config.dart';

/// card that hold Movie or Tv information
class ArtWorkCard extends StatelessWidget {
  /// default constructor
  const ArtWorkCard({
    Key? key,
    required this.argument,
  }) : super(key: key);

  /// screen argument is a class that holds
  /// movie or tv details
  final ScreenArguments argument;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: argument,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(8),
        height: SizeConfig.blockSizeVertical * 35,
        width: SizeConfig.blockSizeHorizontal * 35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedImageWidget(
              imageUrl: argument.backdropPath,
              height: SizeConfig.blockSizeVertical * 25,
              width: SizeConfig.blockSizeHorizontal * 35,
              boxFit: BoxFit.fitHeight,
              borderRadius: 10,
              isCircle: false,
            ),
            const SizedBox(height: 5),
            Flexible(
              child: Text(
                argument.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RatingBarIndicator(
              rating: argument.voteAverage / 2,
              // rating: 1.5,
              itemBuilder: (BuildContext context, int index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 24.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
      ),
    );
  }
}
