import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/src/constant/constants.dart';
import 'package:tiny_widgets/view/widget/omok/stones.dart';

class OmokScreen extends GetView<OmokController> {
  static const name = "/omok_screen";
  const OmokScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _board(),
    );
  }

  Widget _board() {
    int cellCountInRow = OmokConstants.CELL_COUNT_IN_ROW;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cellCountInRow,
      ),
      itemCount: cellCountInRow * cellCountInRow,
      itemBuilder: (context, index) => EmptyStone(),
    );
  }
}
