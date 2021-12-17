import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/src/enum/omok_enums.dart';

class EmptyStone extends StatelessWidget {
  const EmptyStone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BoardPainter(),
    );
  }
}

class BlackStone extends StatelessWidget {
  const BlackStone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ColoredStonePainter(omokColor: OmokColor.BLACK),
    );
  }
}

class WhiteStone extends StatelessWidget {
  const WhiteStone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ColoredStonePainter(omokColor: OmokColor.WHITE),
    );
  }
}

class _ColoredStonePainter extends _BoardPainter {
  final OmokColor omokColor;

  _ColoredStonePainter({required this.omokColor});

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);

    double horizontalCenterPos = size.width / 2;
    double verticalCenterPos = size.height / 2;
    Paint painter = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(radius: 6, colors: [
        omokColor.color(),
        omokColor.oppositeColor(),
      ]).createShader(Offset.zero & size);

    canvas.drawCircle(Offset(horizontalCenterPos, verticalCenterPos),
        size.width / 2, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _BoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double horizontalCenterPos = size.width / 2;
    double verticalCenterPos = size.height / 2;
    Paint painter = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    canvas.drawLine(Offset(horizontalCenterPos, 0),
        Offset(horizontalCenterPos, size.height), painter);
    canvas.drawLine(Offset(0, verticalCenterPos),
        Offset(size.width, verticalCenterPos), painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
