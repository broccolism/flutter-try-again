import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/src/constant/constants.dart';
import 'package:tiny_widgets/src/enum/enums.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class OmokScreen extends GetView<OmokController> {
  static const name = "/omok_screen";
  const OmokScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[600],
      body: Container(
        padding: CommonConstants.SCREEN_HORIZONTAL_MARGIN,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _curTurn(),
            SizedBox(height: 16),
            _boardWrapper(),
          ],
        ),
      ),
    );
  }

  Widget _curTurn() {
    return Obx(
      () => Container(
        width: double.infinity,
        height: 50,
        color: controller.curTurn.color(),
        child: Center(
          child: Text(
            "${controller.curTurn.toStringShort().toUpperCase()}'s turn",
            style: Theme.of(Get.context!).textTheme.headline6!.copyWith(
                  color: controller.curTurn.oppositeColor(),
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ),
    );
  }

  Widget _boardWrapper() {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        color: Colors.amber[100],
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.amber[100],
            border: Border.all(
              width: 2.0,
              color: Colors.black,
            ),
          ),
          child: OmokBoard(),
        ),
      ),
    );
  }
}
