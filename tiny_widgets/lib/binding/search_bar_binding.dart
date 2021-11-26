import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/repository/search_repository.dart';

class SearchBarBinding extends Bindings {
  @override
  void dependencies() {
    SearchRepository searchRepo = Get.find<SearchRepository>();
    Get.lazyPut(() => SearchController(searchRepo: searchRepo));
    Get.lazyPut(() => AutoCompleteController(searchRepo: searchRepo));
  }
}
