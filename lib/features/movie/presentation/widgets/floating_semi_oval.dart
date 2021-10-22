import 'package:flutter/material.dart';

import '../../../../core/constant/constants.dart';
import '../../../../core/shared/vertical_text_tile.dart';

/// Floating semi oval widget that located in details screen
/// and floats above background image
class FloatingSemiOvalWidget extends StatelessWidget {
  /// Constructor
  const FloatingSemiOvalWidget({
    Key? key,
    required this.popularity,
    required this.voteAverage,
    required this.releaseDate,
  }) : super(key: key);

  /// artwork popularity
  final double popularity;

  /// artwork average votes
  final double voteAverage;

  /// artwork release date
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        // side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      // color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.only(left: 30.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            VerticalTextTile(
              title: kReleaseDate,
              subTitle: releaseDate,
            ),
            VerticalTextTile(
              title: kPopularity,
              subTitle: popularity.toString(),
            ),
            VerticalTextTile(
              title: kRate,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: getRateBackgroundColor(
                    voteAverage,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 3,
                  ),
                  child: Text(
                    voteAverage.toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
