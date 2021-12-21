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
  final Rx<OmokColor?> _winner = Rx<OmokColor?>(null);

  List<List<OmokStone>> get board => _board;
  OmokColor get curTurn => _curTurn.value;
  bool get hasWinner => _winner.value != null;
  OmokColor get winner => _winner.value!;

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

    OmokColor? winner = _checkWinner();

    if (winner != null) {
      _winner.value = winner;
    } else {
      _curTurn.value = _curTurn.value.oppositeOmokColor();
    }
  }

  OmokColor? _checkWinner() {
    for (int row = 0; row < OmokConstants.CELL_COUNT_IN_ROW; ++row) {
      for (int col = 0; col < OmokConstants.CELL_COUNT_IN_ROW; ++col) {
        if (_board[row][col] == OmokStone.EMPTY) continue;

        OmokPosition curPos = OmokPosition(row: row, col: col);

        List<OmokPosition> checkList = [
          curPos.goRight().goUp(),
          curPos.goRight(),
          curPos.goRight().goDown(),
          curPos.goDown(),
        ];

        for (int i = 0; i < checkList.length; ++i) {
          OmokPosition movedPos = checkList[i];
          OmokPosition diff = curPos - movedPos;

          bool hasFiveStones = true;
          for (int move = 0; move < OmokConstants.LINE_LENGTH_TO_WIN; ++move) {
            if (!movedPos.isValid() ||
                _board[curPos.row][curPos.col] !=
                    _board[movedPos.row][movedPos.col]) {
              hasFiveStones = false;
              break;
            }
            movedPos += diff;
          }

          if (hasFiveStones) {
            return _board[curPos.row][curPos.col].toOmokColor();
          }
        }
      }
    }
  }
}
