import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/src/constant/constants.dart';
import '../widgets.dart';

class OmokBoard extends StatelessWidget {
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
      itemBuilder: (context, index) => EmptyStone(),
    );
  }
}
