import 'package:flutter/material.dart';

/// custom label explain the content
/// below it
class CustomLabel extends StatelessWidget {
  /// default constructor
  const CustomLabel({
    Key? key,
    required this.title,
    required this.padding,
  }) : super(key: key);

  /// main title
  final String title;

  /// padding around widget
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
