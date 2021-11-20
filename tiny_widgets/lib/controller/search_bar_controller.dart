import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/util/ui.dart';

class SearchBarController extends GetxController {
  late final TextEditingController _keywordController;

  final RxList<SearchResult> _curResults = <SearchResult>[].obs;

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
  List<SearchResult> get curResults => _curResults;

  void onChangeTextField(String input) {
    if (input.isEmpty) {
      _curResults.value = [];
    } else {
      _curResults.value = [
        SearchResult.sample,
        SearchResult.sample,
        SearchResult.sample,
      ];
    }
  }

  void onTapAutocompleteItem(SearchResult item) {
    _keywordController.text = item.name;
    _curResults.value = [];
    MyUiUtils.moveTextEditingCursorToBack(_keywordController);
  }
}
