import 'package:get/get.dart';
import 'package:tiny_widgets/controller/search_bar_controller.dart';

class SearchBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchBarController());
  }
}
