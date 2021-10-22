import 'package:flutter/material.dart';

import '../../../../core/shared/vertical_text_tile.dart';

/// Simple widget that shows A Row holds
/// some information about person
class InformationCard extends StatelessWidget {
  /// Constructor
  const InformationCard({
    Key? key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.subTitle1,
    required this.subTitle2,
    required this.subTitle3,
    this.child,
  }) : super(key: key);

  /// first title
  final String title1;

  /// Second title
  final String title2;

  /// third title
  final String title3;

  /// first sub title
  final String subTitle1;

  /// Second sub title
  final String subTitle2;

  /// third sub title
  final String subTitle3;

  /// child instead of subtitle
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: VerticalTextTile(
            title: title1,
            subTitle: subTitle1,
            child: child,
          ),
        ),
        Expanded(
          child: VerticalTextTile(
            title: title2,
            subTitle: subTitle2,
          ),
        ),
        Expanded(
          child: VerticalTextTile(
            title: title3,
            subTitle: subTitle3,
          ),
        ),
      ],
    );
  }
}
