import 'dart:developer';
import 'dart:io';

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
    if (_board[pos.row][pos.col].isNotEmpty()) {
      return;
    }

    _board[pos.row][pos.col] = _curTurn.value.toStone();

    _checkFiveStones();
    _printBoard();

    _curTurn.value = _curTurn.value.oppositeOmokColor();
  }

  OmokColor? _checkFiveStones() {
    for (int i = 0; i < OmokConstants.CELL_COUNT_IN_ROW; ++i) {
      for (int j = 0; j < OmokConstants.CELL_COUNT_IN_ROW; ++j) {
        if (_board[i][j] == OmokStone.EMPTY) continue;

        bool isValid = true;
        for (int move = 0; move < OmokConstants.LINE_LENGTH_TO_WIN; ++move) {
          if (i + move >= OmokConstants.CELL_COUNT_IN_ROW ||
              _board[i][j] != _board[i + move][j]) {
            isValid = false;
            break;
          }
        }

        if (isValid) {
          log("@@@@@@@@@ DONE", name: "@@@@@@@@@");
        }
      }
    }
  }

  void _printBoard() {
    String _toNumString(OmokStone stone) {
      switch (stone) {
        case OmokStone.EMPTY:
          return " ";
        case OmokStone.BLACK:
          return "B";
        case OmokStone.WHITE:
          return "W";
      }
    }

    for (int i = 0; i < OmokConstants.CELL_COUNT_IN_ROW; ++i) {
      String line = "";
      for (int j = 0; j < OmokConstants.CELL_COUNT_IN_ROW; ++j) {
        line += _toNumString(_board[i][j]);
      }
      log(line, name: i.toString());
    }
  }
}
