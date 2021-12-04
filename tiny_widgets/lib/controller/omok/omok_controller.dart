import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:tiny_widgets/src/constant/constants.dart';
import 'package:tiny_widgets/src/enum/enums.dart';
import 'package:tiny_widgets/util/extension.dart';

class OmokController extends GetxController {
  late final RxList<OmokStone> _board;
  final Rx<OmokColor> _curTurn = OmokColor.BLACK.obs;

  List<OmokStone> get board => _board;
  OmokColor get curTurn => _curTurn.value;

  @override
  void onInit() {
    super.onInit();
    _initBoard();
    _initTurn();
  }

  void _initBoard() {
    _board = List.generate(
        OmokConstants.CELL_COUNT_IN_ROW * OmokConstants.CELL_COUNT_IN_ROW,
        (_) => OmokStone.EMPTY).obs;
  }

  void _initTurn() {
    _curTurn.value = OmokColor.BLACK;
  }

  void putStone(int targetIndex) {
    if (_board[targetIndex].isNotEmpty()) {
      return;
    }

    _board.value = _board
        .mapWithIndex((OmokStone stone, int index) =>
            index != targetIndex ? stone : _curTurn.value.toStone())
        .toList();

    _curTurn.value = _curTurn.value.oppositeOmokColor();
  }
}
