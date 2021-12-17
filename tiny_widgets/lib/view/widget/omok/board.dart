import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/model/models.dart';
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
    OmokPosition pos = OmokPosition.fromIndex(index);
    return Obx(
      () => GestureDetector(
        onTap: () => controller.putStone(pos),
        // TODO: board[pos.col][pos.row] 인터페이스 바꾸기
        child: _omokStoneByColor(controller.board[pos.col][pos.row]),
      ),
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
