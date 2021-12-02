import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tiny_widgets/model/search.dart';
import 'package:tiny_widgets/view/screen/screens.dart';

class SearchResultController extends GetxController {
  final Rx<GoogleSearch?> _result = Rx<GoogleSearch?>(null);

  // TODO: what happens if I use onReady instead of onInit?
  @override
  void onInit() {
    super.onInit();
    SearchResultScreenArgs args = Get.arguments;
    _result.value = args.result;
  }

  GoogleSearch? get result => _result.value;
  String get title => _result.value != null ? _result.value!.title : "";
}
