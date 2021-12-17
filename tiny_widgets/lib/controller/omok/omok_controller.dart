import 'dart:collection';
import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/src/constant/constants.dart';
import 'package:tiny_widgets/src/constant/omok_constants.dart';
import 'package:tiny_widgets/src/enum/enums.dart';

class OmokController extends GetxController {
  late final RxList<List<OmokStone>> _board;
  final Rx<OmokColor> _curTurn = OmokColor.BLACK.obs;

  List<List<OmokStone>> get board => _board;
  OmokColor get curTurn => _curTurn.value;

  @override
  void onInit() {
    super.onInit();
    _initBoard();
    _initTurn();
  }

  void _initBoard() {
    List<OmokStone> row =
        List.generate(OmokConstants.CELL_COUNT_IN_ROW, (_) => OmokStone.EMPTY);
    _board = List.generate(
        OmokConstants.CELL_COUNT_IN_ROW, (_) => List<OmokStone>.from(row)).obs;
  }

  void _initTurn() {
    _curTurn.value = OmokColor.BLACK;
  }

  void putStone(OmokPosition pos) {
    if (_board[pos.col][pos.row].isNotEmpty()) {
      return;
    }

    _board.value[pos.col][pos.row] = _curTurn.value.toStone();

    _curTurn.value = _curTurn.value.oppositeOmokColor();
    _checkFiveStones();
  }

  OmokColor? _checkFiveStones() {
    List<List<OmokStone>> copyOfBoard = List<List<OmokStone>>.from(
        _board.map((List<OmokStone> row) => List<OmokStone>.from(row)));
    OmokPosition _posDown(OmokPosition pos) =>
        OmokPosition(col: pos.col, row: pos.row + 1);
    OmokPosition _posUp(OmokPosition pos) =>
        OmokPosition(col: pos.col, row: pos.row - 1);
    OmokPosition _posRight(OmokPosition pos) =>
        OmokPosition(col: pos.col + 1, row: pos.row);
    OmokPosition _posLeft(OmokPosition pos) =>
        OmokPosition(col: pos.col - 1, row: pos.row);
    bool _canGoDown(OmokPosition pos) =>
        pos.row < OmokConstants.CELL_COUNT_IN_ROW - 1;
    bool _canGoUp(OmokPosition pos) => pos.row > 1;
    bool _canGoRight(OmokPosition pos) =>
        pos.col < OmokConstants.CELL_COUNT_IN_ROW - 1;
    bool _canGoLeft(OmokPosition pos) => pos.col > 1;

    for (int i = 0; i < OmokConstants.CELL_COUNT_IN_ROW; ++i) {
      for (int j = 0; j < OmokConstants.CELL_COUNT_IN_ROW; ++j) {
        if (copyOfBoard[i][j].isNotEmpty() &&
            (copyOfBoard[i][j] == _curTurn.value.toStone())) {
          int count = 0;

          Queue<OmokPosition> queue = Queue();
          copyOfBoard[i][j] = OmokStone.EMPTY;
          queue.add(OmokPosition(col: i, row: j));

          while (queue.isNotEmpty) {
            OmokPosition curPos = queue.removeFirst();
            count += 1;

            if (_canGoDown(curPos)) {
              queue.add(_posDown(curPos));
              count += 1;
            }
            if (_canGoUp(curPos)) {
              queue.add(_posUp(curPos));
              count += 1;
            }
            if (_canGoRight(curPos)) {
              queue.add(_posRight(curPos));
              count += 1;
            }
            if (_canGoLeft(curPos)) {
              queue.add(_posLeft(curPos));
              count += 1;
            }

            if (count >= 5) {
              log("message");
              return _board[curPos.col][curPos.row].toOmokColor();
            }
          }
        }
      }
    }
  }
}
