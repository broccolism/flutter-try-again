import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:tiny_widgets/src/constant/constants.dart';
import 'package:tiny_widgets/src/enum/enums.dart';

class OmokController extends GetxController {
  late final RxList<List<OmokStone>> board;
  final Rx<OmokColor> curTurn = OmokColor.BLACK.obs;

  @override
  void onInit() {
    super.onInit();
    _initBoard();
    _initTurn();
  }

  void _initBoard() {
    List<OmokStone> row =
        List.generate(OmokConstants.CELL_COUNT_IN_ROW, (_) => OmokStone.EMPTY);
    board = List.generate(OmokConstants.CELL_COUNT_IN_ROW, (_) => row).obs;
  }

  void _initTurn() {
    curTurn.value = OmokColor.BLACK;
  }
}
