import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:tiny_widgets/src/constant/constants.dart';
import 'package:tiny_widgets/src/enum/enums.dart';

class OmokController extends GetxController {
  late final RxList<List<OmokStone>> board;
  late final Rx<OmokColor> curTurn;

  @override
  void onInit() {
    super.onInit();
    _initBoard();
    _initTurn();
  }

  void _initBoard() {
    List<OmokStone> row =
        List.generate(OmokConstants.BOARD_SIZE, (_) => OmokStone.EMPTY);
    board.value = List.generate(OmokConstants.BOARD_SIZE, (_) => row);
  }

  void _initTurn() {
    curTurn.value = OmokColor.BLACK;
  }
}
