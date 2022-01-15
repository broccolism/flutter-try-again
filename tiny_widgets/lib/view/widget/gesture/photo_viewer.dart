import 'package:flutter/widgets.dart';

class PhotoViewer extends StatefulWidget {
  const PhotoViewer({Key? key}) : super(key: key);

  @override
  _PhotoViewerState createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  double _scale = 1.0;
  final String IMAGE_NAME = "assets/images/broccoli";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(IMAGE_NAME),
    );
  }
}
