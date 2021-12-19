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

    // 현재 돌과 같은 색상인 칸 찾기
    // 가장 끝 돌이 아니면 패스 = 북서, 북동, 북, 서쪽에 자신과 같은 색상 돌이 있으면 패스.
    // 만약 가장 끝 돌을 찾았다면
    //  오른쪽으로 가면서 empty 처리하기 -> 5면 win
    //  아래쪽으로 가면서 empty 처리하기 -> 5면 win
    //  남서방향 대각선으로 가면서 empty 처리하기 -> 5면 win
    //  남동방향 대각선으로 가면서 empty 처리하기 -> 5면 win
  }
}
