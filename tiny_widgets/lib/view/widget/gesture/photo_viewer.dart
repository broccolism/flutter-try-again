import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/view/widget/gesture/photo_foreground.dart';

class PhotoViewer extends StatefulWidget {
  const PhotoViewer({Key? key}) : super(key: key);

  @override
  _PhotoViewerState createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _background(),
        _foreground(),
      ],
    );
  }

  Widget _background() {
    return Container(
      width: Get.size.width,
      height: Get.size.height,
      color: Colors.black,
    );
  }

  Widget _foreground() {
    return PhotoForeground();
  }
}
