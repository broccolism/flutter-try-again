import 'package:get/get.dart';
import 'package:tiny_widgets/controller/omok/omok_controller.dart';

class OmokBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OmokController());
  }
}
