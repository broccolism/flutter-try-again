import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/repository/search_repository.dart';
import 'package:tiny_widgets/util/ui.dart';

class SearchController extends GetxController {
  final SearchRepository searchRepo;
  SearchController({required this.searchRepo});

  late final TextEditingController _inputController = TextEditingController();
  final RxList<GoogleSearch> _curResults = <GoogleSearch>[].obs;

  TextEditingController get keywordController => _inputController;
  List<GoogleSearch> get curResults => _curResults;
  static SearchController get to => Get.find();

  @override
  void onClose() {
    _inputController.dispose();
    super.onClose();
  }

  void addChangeListener(void Function(String) listener) {
    _inputController.addListener(() => listener(_inputController.text));
  }

  void clearTextField() {
    _inputController.clear();
    _curResults.value = [];
  }

  void onTapAutoCompleteItem(GoogleSearch item) {
    _inputController.text = item.title;
    _curResults.value = [];
    MyUiUtils.moveTextEditingCursorToBack(_inputController);
  }

  Future<void> searchOnGoogle(String keyword) async {
    _curResults.value = await searchRepo.searchOnGoogle(keyword);
  }
}
