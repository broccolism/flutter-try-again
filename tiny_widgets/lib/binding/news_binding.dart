import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsController());
  }
}
