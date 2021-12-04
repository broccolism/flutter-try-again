import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Paint linePainter = Paint()
  ..color = Colors.black
  ..strokeWidth = 1;

class EmptyStone extends StatelessWidget {
  const EmptyStone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _EmptyStonePainter(),
    );
  }
}

class _EmptyStonePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double horizontalCenterPos = size.width / 2;
    double verticalCenterPos = size.height / 2;

    canvas.drawLine(Offset(horizontalCenterPos, 0),
        Offset(horizontalCenterPos, size.height), linePainter);
    canvas.drawLine(Offset(0, verticalCenterPos),
        Offset(size.width, verticalCenterPos), linePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BlackStone extends StatelessWidget {
  const BlackStone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      color: Colors.black,
    );
  }
}

class WhiteStone extends StatelessWidget {
  const WhiteStone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      color: Colors.white,
    );
  }
}
