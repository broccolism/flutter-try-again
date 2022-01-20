import 'dart:math';

import 'package:flutter/material.dart';
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

  Offset position = Offset(0, 0);
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
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onScaleUpdate: _onScaleUpdate,
      child: Transform.translate(
        offset: position,
        child: Transform.scale(
          scale: scale,
          child: Image.asset(
            CommonConstants.DEFAULT_IMAGE_PATH,
            width: _imageWidth(),
            height: _imageHeight(),
          ),
        ),
      ),
    );
  }

  void _onDoubleTap() {
    setState(() {
      scale = 1.0;
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      scale = details.scale;
    });
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    double dx = min(details.globalPosition.dx, maxWidth);
    setState(() {
      position = Offset(dx, position.dy);
    });
  }

  double _imageWidth() => min(imageWidth * scale, maxWidth);
  double _imageHeight() => min(imageHeight * scale, maxHeight);
}
