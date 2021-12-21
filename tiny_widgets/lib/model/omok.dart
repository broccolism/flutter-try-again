import 'package:tiny_widgets/src/constant/omok_constants.dart';

class OmokPosition {
  final int row;
  final int col;

  OmokPosition({required this.row, required this.col});

  factory OmokPosition.fromIndex(int index) => OmokPosition(
      col: index % OmokConstants.CELL_COUNT_IN_ROW,
      row: index ~/ OmokConstants.CELL_COUNT_IN_ROW);

  factory OmokPosition.copyOf(OmokPosition pos) =>
      OmokPosition(col: pos.col, row: pos.row);

  bool isValid() =>
      (col >= 0 && col < OmokConstants.CELL_COUNT_IN_ROW) &&
      (row >= 0 && row < OmokConstants.CELL_COUNT_IN_ROW);

  OmokPosition goUp() => OmokPosition(col: col, row: row - 1);
  OmokPosition goDown() => OmokPosition(col: col, row: row + 1);
  OmokPosition goLeft() => OmokPosition(col: col - 1, row: row);
  OmokPosition goRight() => OmokPosition(col: col + 1, row: row);

  @override
  String toString() => "($col, $row)";

  operator -(OmokPosition pos) =>
      OmokPosition(row: row - pos.row, col: col - pos.col);
  operator +(OmokPosition pos) =>
      OmokPosition(row: row + pos.row, col: col + pos.col);
}
