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
  Offset position = Offset(0, 0);

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
    const Widget child = PhotoForeground();

    return Draggable(
      maxSimultaneousDrags: 2,
      feedback: Opacity(
        opacity: 0,
        child: child,
      ),
      onDragEnd: _onDragEnd,
      child: SizedBox(
        height: Get.size.height,
        child: Center(
          child: child,
        ),
      ),
    );
  }

  void _onDragEnd(DraggableDetails details) {
    // setState(() {
    //   position = details.offset;
    // });
  }
}
