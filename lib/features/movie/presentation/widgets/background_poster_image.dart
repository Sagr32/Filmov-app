import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/endpoint.dart';
import '../../../../core/shared/cache_image_placeholder.dart';
import '../../../../core/utils/size_config.dart';

/// Background image for details Screen
class BackgroundPosterImage extends StatelessWidget {
  /// default constructor
  const BackgroundPosterImage({Key? key, required this.imagePath})
      : super(key: key);

  /// imagepath
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder:
          (BuildContext context, ImageProvider<Object> imageProvider) =>
              Container(
        height: SizeConfig.blockSizeVertical * 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
          ),
          image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
        ),
      ),
      fit: BoxFit.cover,
      imageUrl: getImagePath(imagePath),
      placeholder: (BuildContext context, String url) => CachedImagePlaceholder(
        height: SizeConfig.blockSizeVertical * 50,
        width: double.infinity,
        isCircle: false,
      ),
    );
  }
}
