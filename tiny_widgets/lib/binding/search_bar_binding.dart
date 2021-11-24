import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/repository/search_repository.dart';

class SearchBarBinding extends Bindings {
  @override
  void dependencies() {
    SearchRepository searchRepository = Get.find<SearchRepository>();
    Get.lazyPut(() => SearchBarController(searchRepo: searchRepository));
  }
}
