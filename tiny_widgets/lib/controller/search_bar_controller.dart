import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SearchBarController extends GetxController {
  late final TextEditingController _keywordController;

  @override
  void onInit() {
    super.onInit();
    _keywordController = TextEditingController();
  }

  @override
  void onClose() {
    _keywordController.dispose();
    super.onClose();
  }

  TextEditingController get keywordController => _keywordController;
}
