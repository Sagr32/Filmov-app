import 'package:flutter/material.dart';

///  Widget that shows
/// Circular indicator while loading
class LoadingWidget extends StatelessWidget {
  /// Constructor
  const LoadingWidget({Key? key, required this.height, required this.width})
      : super(key: key);

  /// widget height
  final double height;

  /// widget width
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
