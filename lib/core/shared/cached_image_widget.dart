import 'package:cached_network_image/cached_network_image.dart';
import '../constant/constants.dart';
import '../utils/size_config.dart';
import '../constant/endpoint.dart';
import 'cache_image_placeholder.dart';
import 'package:flutter/material.dart';

/// Widget that use [Cached Image Network] 
/// to show images in it 
class CachedImageWidget extends StatelessWidget {
  /// Constructor
  const CachedImageWidget(
      {Key? key,
      required this.imageUrl,
      required this.height,
      required this.width,
      required this.boxFit,
      required this.borderRadius,
      required this.isCircle})
      : super(key: key);
  /// padding around the widget
  final double borderRadius;
  /// image path or link
  final String imageUrl;
  /// widget height
  final double height;
  /// widget width
  final double width;
  /// image boxfit 

  final BoxFit boxFit;
  /// check if the widget should be normal 
  /// or circular shape
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl == 'None' ? kImagePlaceHolder : getImagePath(imageUrl),
      imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
          isCircle
              ? CircleAvatar(
                  backgroundImage: imageProvider,
                  maxRadius: SizeConfig.blockSizeHorizontal * 15,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Image(
                    image: imageProvider,
                    height: height,
                    width: width,
                    fit: boxFit,
                  ),
                ),
      placeholder: (BuildContext context, String url) => CachedImagePlaceholder(
        height: height,
        width: width,
        isCircle: isCircle,
      ),
      errorWidget: (BuildContext context, String url, dynamic error) =>
          CachedImagePlaceholder(
        height: height,
        width: width,
        isCircle: isCircle,
      ),
    );
  }
}
