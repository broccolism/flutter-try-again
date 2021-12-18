import 'dart:collection';
import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/src/constant/constants.dart';
import 'package:tiny_widgets/src/constant/omok_constants.dart';
import 'package:tiny_widgets/src/enum/enums.dart';

class OmokController extends GetxController {
  late final RxList<RxList<OmokStone>> _board;
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
    _board = List.generate(OmokConstants.CELL_COUNT_IN_ROW,
        (_) => List<OmokStone>.from(row).obs).obs;
  }

  void _initTurn() {
    _curTurn.value = OmokColor.BLACK;
  }

  void putStone(OmokPosition pos) {
    log("put stone on $pos");
    if (_board[pos.col][pos.row].isNotEmpty()) {
      return;
    }

    _board[pos.col][pos.row] = _curTurn.value.toStone();

    _checkFiveStones();

    _curTurn.value = _curTurn.value.oppositeOmokColor();
  }

  OmokColor? _checkFiveStones() {
    List<List<OmokStone>> copyOfBoard = List<List<OmokStone>>.from(
        _board.map((List<OmokStone> row) => List<OmokStone>.from(row)));

    // TODO: refactor!!!!!
    bool _canGoDown(OmokPosition pos) {
      log((pos.row < OmokConstants.CELL_COUNT_IN_ROW - 1).toString());
      log("${copyOfBoard[pos.col][pos.row + 1]}, ${copyOfBoard[pos.col][pos.row]}");
      return pos.row < OmokConstants.CELL_COUNT_IN_ROW - 1 &&
          copyOfBoard[pos.col][pos.row + 1] == copyOfBoard[pos.col][pos.row];
    }

    bool _canGoUp(OmokPosition pos) =>
        pos.row > 1 &&
        copyOfBoard[pos.col][pos.row - 1] == copyOfBoard[pos.col][pos.row];
    bool _canGoRight(OmokPosition pos) =>
        pos.col < OmokConstants.CELL_COUNT_IN_ROW - 1 &&
        copyOfBoard[pos.col + 1][pos.row] == copyOfBoard[pos.col][pos.row];
    bool _canGoLeft(OmokPosition pos) =>
        pos.col > 1 &&
        copyOfBoard[pos.col - 1][pos.row] == copyOfBoard[pos.col][pos.row];
  }
}
