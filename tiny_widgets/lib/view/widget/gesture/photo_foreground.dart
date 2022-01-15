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
  final double width = Get.size.width;
  final double height = Get.size.height;
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
    print(scale);
    return GestureDetector(
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      child: Image.asset(
        CommonConstants.BROCCOLI_IMAGE_PATH,
        width: width * scale,
        height: height * scale,
      ),
    );
  }

  void _onScaleStart(ScaleStartDetails details) {
    print(details.toString());
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      scale = details.scale;
    });
  }
}
