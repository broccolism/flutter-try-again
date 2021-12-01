import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';

class SearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchResultController());
  }
}
