import 'package:tiny_widgets/src/constant/omok_constants.dart';

class OmokPosition {
  final int col;
  final int row;

  OmokPosition({required this.col, required this.row});

  factory OmokPosition.fromIndex(int index) => OmokPosition(
      col: index % OmokConstants.CELL_COUNT_IN_ROW,
      row: index ~/ OmokConstants.CELL_COUNT_IN_ROW);

  @override
  String toString() => "($col, $row)";
}
