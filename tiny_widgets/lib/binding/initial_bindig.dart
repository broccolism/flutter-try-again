import 'package:get/get.dart';
import 'package:tiny_widgets/provider/providers.dart';
import 'package:tiny_widgets/repository/repositories.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchRepository>(
        SearchRepository(searchProvider: SearchProvider()));
  }
}
