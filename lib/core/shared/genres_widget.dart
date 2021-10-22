import '../utils/get_genres.dart';

import '../utils/size_config.dart';
import 'package:flutter/material.dart';

/// Widget that takes list on integer genres
/// and return them in String
class GenresWidget extends StatelessWidget {
  /// Constructor
  const GenresWidget({
    Key? key,
    required this.genreIds,
  }) : super(key: key);

  /// genres in Integer type
  final List<int> genreIds;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 5,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: genreIds.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              '${getGenres(genreIds)[index]}',
              style: Theme.of(context).textTheme.subtitle1,
            )),
          );
        },
      ),
    );
  }
}
