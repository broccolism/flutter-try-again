import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/src/constant/constants.dart';
import 'package:tiny_widgets/src/enum/enums.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class OmokBoard extends GetView<OmokController> {
  const OmokBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int cellCountInRow = OmokConstants.CELL_COUNT_IN_ROW;
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cellCountInRow,
      ),
      itemCount: cellCountInRow * cellCountInRow,
      itemBuilder: _itemBuilder,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Obx(
      () => GestureDetector(
          onTap: () => controller.putStone(index),
          child: _omokStoneByColor(controller.board[index])),
    );
  }

  Widget _omokStoneByColor(OmokStone stone) {
    switch (stone) {
      case OmokStone.EMPTY:
        return EmptyStone();
      case OmokStone.BLACK:
        return BlackStone();
      case OmokStone.WHITE:
        return WhiteStone();
    }
  }
}
