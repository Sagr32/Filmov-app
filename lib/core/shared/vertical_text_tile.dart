import 'package:flutter/material.dart';

/// Vertical Widget in Details Screen
/// that holds two Texts Like :
/// vote average : 6.2
class VerticalTextTile extends StatelessWidget {
  /// Constructor
  const VerticalTextTile({
    Key? key,
    required this.title,
    this.subTitle,
    this.child,
  }) : super(key: key);

  /// title or main Text
  final String title;

  /// subtutle or secondary text
  final String? subTitle;

  /// child widget in case of there is no secondary text
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        child ??
            Text(
              subTitle!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }
}
