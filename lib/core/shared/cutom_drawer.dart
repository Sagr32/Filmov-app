import '../constant/constants.dart';
import 'drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// Custom Drawer
class CustomDrawer extends StatelessWidget {
  /// Default Constructor
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerItem(
            icon: FontAwesomeIcons.github,
            onTap: () async {
              await canLaunch(kGithubLink)
                  ? await launch(kGithubLink)
                  : throw 'Could not launch $kGithubLink';
            },
            title: 'Github',
          ),
          const Divider(),
          DrawerItem(
            onTap: () async {
              await canLaunch(kLinkedinLink)
                  ? await launch(kLinkedinLink)
                  : throw 'Could not launch $kLinkedinLink';
            },
            title: 'Linkedin',
            icon: FontAwesomeIcons.linkedin,
          ),
          const Divider(),
          DrawerItem(
            onTap: () async {
              await canLaunch(kAppLink)
                  ? await launch(kAppLink)
                  : throw 'Could not launch $kAppLink';
            },
            title: 'Rate us',
            icon: FontAwesomeIcons.star,
          ),
          const Divider()
        ],
      ),
    );
  }
}
