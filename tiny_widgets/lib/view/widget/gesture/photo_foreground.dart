import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/src/constant/constants.dart';

class PhotoForeground extends StatefulWidget {
  const PhotoForeground({Key? key}) : super(key: key);

  @override
  _PhotoForegroundState createState() => _PhotoForegroundState();
}

class _PhotoForegroundState extends State<PhotoForeground>
    with TickerProviderStateMixin {
  final double maxWidth = Get.size.width;
  final double maxHeight = Get.size.height;
  final double imageWidth = Get.size.width;
  final double imageHeight = Get.size.height;
  double scale = 1.0;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _onDoubleTap,
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      child: Transform.scale(
        scale: scale,
        child: Image.asset(
          CommonConstants.BROCCOLI_IMAGE_PATH,
          width: _fitImageWidth(),
          height: _fitImageHeight(),
        ),
      ),
    );
  }

  void _onDoubleTap() {
    setState(() {
      scale = 1.0;
    });
  }

  void _onScaleStart(ScaleStartDetails details) {
    print(details.toString());
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    print(details.localFocalPoint);
    setState(() {
      scale = details.scale;
    });
  }

  double _fitImageWidth() => min(imageWidth * scale, maxWidth);
  double _fitImageHeight() => min(imageHeight * scale, maxHeight);
}
