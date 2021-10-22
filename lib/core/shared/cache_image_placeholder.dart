import 'package:flutter/material.dart';

/// Place holder widget for cached image widget
class CachedImagePlaceholder extends StatelessWidget {
  /// Constructor
  const CachedImagePlaceholder({
    Key? key,
    required this.height,
    required this.width,
    required this.isCircle,
  }) : super(key: key);
  /// widget height
  final double height;

  /// widget width
  final double width;

  ///check if the widget should be 
  ///in normal shape or circular
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return isCircle
        ? CircleAvatar(
            maxRadius: width,
            backgroundImage: const AssetImage('assets/images/logo.png'),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF764bc4),
            ),
            height: height,
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/logo.png',
                height: height,
              ),
            ),
          );
  }
}
