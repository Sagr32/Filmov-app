import 'package:flutter/material.dart';

import '../../../../core/shared/custom_label.dart';
import '../../../movie/presentation/widgets/movies_for_person_widget.dart';
import '../widgets/person_details.dart';

/// Screen that shows all information about person or actor
/// and his movies
class PersonDetailsScreen extends StatelessWidget {
  /// constructor
  const PersonDetailsScreen({Key? key}) : super(key: key);

  /// route name
  static const String routeName = '/person-details';

  @override
  Widget build(BuildContext context) {
    final int personId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          PersonDetailsWidget(personId: '$personId'),
          const CustomLabel(
            title: 'Movies',
            padding: EdgeInsets.all(
              4.0,
            ),
          ),
          MoviesForPersonWidget(
            personId: '$personId',
          ),
        ],
      ),
    );
  }
}
