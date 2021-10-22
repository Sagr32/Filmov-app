import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constant/constants.dart';
import '../../../../core/shared/cached_image_widget.dart';
import '../../../../core/shared/custom_label.dart';
import '../../../../core/shared/loading_widget.dart';
import '../../../../core/shared/message_display.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../injection_container.dart';
import '../bloc/person_details/person_details_bloc.dart';
import 'information_card.dart';

/// widget that represent popular Tv as a carousel slider
class PersonDetailsWidget extends StatelessWidget {
  /// default constructor
  const PersonDetailsWidget({Key? key, required this.personId})
      : super(key: key);

  /// target person to get his details
  final String personId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonDetailsBloc>(
      create: (_) => sl<PersonDetailsBloc>()
        ..add(
          GetPersonDetailsEvent(personId: personId),
        ),
      child: Column(
        children: <Widget>[
          BlocBuilder<PersonDetailsBloc, PersonDetailsState>(
            builder: (BuildContext context, PersonDetailsState state) {
              if (state is PersonDetailsLoading) {
                return LoadingWidget(
                  height: SizeConfig.blockSizeVertical * 40,
                  width: double.infinity,
                );
              } else if (state is PersonDetailsLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CachedImageWidget(
                        borderRadius: 0,
                        boxFit: BoxFit.cover,
                        imageUrl: state.person.profilePath,
                        isCircle: false,
                        height: SizeConfig.blockSizeVertical * 40,
                        width: double.infinity,
                      ),
                      Center(
                        child: CustomLabel(
                          title: state.person.name,
                          padding: const EdgeInsets.all(
                            4.0,
                          ),
                        ),
                      ),
                      const CustomLabel(
                        title: 'Biography',
                        padding: EdgeInsets.all(
                          4.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          state.person.biography,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                        margin: const EdgeInsets.all(4.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              InformationCard(
                                title1: 'Known For',
                                subTitle1: state.person.knownForDepartment,
                                title2: 'Date of birth',
                                subTitle2: state.person.birthday,
                                title3: 'Place of birth',
                                subTitle3: state.person.placeOfBirth,
                              ),
                              Divider(),
                              const SizedBox(
                                height: 5,
                              ),
                              InformationCard(
                                title1: 'IMDB',
                                subTitle1: state.person.imdbId,
                                child: GestureDetector(
                                  onTap: () async {
                                    await canLaunch(
                                            kImdbLink + state.person.imdbId)
                                        ? await launch(
                                            kImdbLink + state.person.imdbId)
                                        : throw 'Could not launch${state.person.imdbId}';
                                  },
                                  child: const Text(
                                    'IMDB',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                title2: 'Date of death',
                                subTitle2: state.person.deathday,
                                subTitle3: state.person.popularity.toString(),
                                title3: 'Popularity',
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is PersonDetailsError) {
                return MessageDisplay(
                  message: state.message,
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
