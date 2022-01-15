import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/src/constant/common_constants.dart';

class PhotoViewer extends StatefulWidget {
  const PhotoViewer({Key? key}) : super(key: key);

  @override
  _PhotoViewerState createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(CommonConstants.BROCCOLI_IMAGE_PATH),
    );
  }
}
