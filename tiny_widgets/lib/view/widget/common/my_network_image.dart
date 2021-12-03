import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/src/constant/common_constants.dart';

class MyNetworkImage extends StatelessWidget {
  final String? url;
  final double width;
  final double height;
  final BoxFit fit;
  const MyNetworkImage({
    Key? key,
    required this.url,
    this.width = double.infinity,
    this.height = 300,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url != null ? _networkImage() : _defaultImge();
  }

  Widget _networkImage() {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: url!,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget _defaultImge() {
    return Image.asset(CommonConstants.DEFAULT_IMAGE_PATH);
  }
}
