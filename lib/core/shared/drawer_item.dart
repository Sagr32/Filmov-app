import 'package:flutter/material.dart';

/// Single item in custom drawer menu
class DrawerItem extends StatelessWidget {
  /// Default constructor
  const DrawerItem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  /// event when clicking on item
  final Function onTap;

  /// item title
  final String title;

  /// item icon
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
