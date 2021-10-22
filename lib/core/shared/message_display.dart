import 'package:flutter/material.dart';

/// Widget that shows message
class MessageDisplay extends StatelessWidget {
  /// Constructor
  const MessageDisplay({
    Key? key,
    required this.message,
  }) : super(key: key);

  /// message that shows in widget
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
