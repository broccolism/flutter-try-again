import 'dart:developer';

import 'package:flutter/material.dart';
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

    // TODO: visitChildElements() 다시 보기
    Get.dialog(
      Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
    Get.dialog(
      Center(
        child: Container(
          width: 70,
          height: 70,
          color: Colors.red,
        ),
      ),
    );
  }

  GoogleSearch? get result => _result.value;
  String get title => _result.value != null ? _result.value!.title : "";
}
