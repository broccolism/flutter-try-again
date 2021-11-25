import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/repository/search_repository.dart';
import 'package:tiny_widgets/util/ui.dart';

class SearchBarController extends GetxController {
  final SearchRepository searchRepo;

  late final TextEditingController _keywordController;

  final RxList<GoogleSearch> _curResults = <GoogleSearch>[].obs;

  SearchBarController({required this.searchRepo});

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
  List<GoogleSearch> get curResults => _curResults;

  void onChangeTextField({
    required String input,
    required void Function() showOverlay,
    required void Function() removeOverlay,
  }) {
    if (input.isEmpty) {
      _curResults.value = [];
      removeOverlay();
    } else {
      searchOnGoogle("");
      showOverlay();
    }
  }

  void onClearTextField() {
    _keywordController.clear();
    _curResults.value = [];
  }

  void onTapAutocompleteItem(GoogleSearch item) {
    _keywordController.text = item.title;
    _curResults.value = [];
    MyUiUtils.moveTextEditingCursorToBack(_keywordController);
  }

  Future<void> searchOnGoogle(String keyword) async {
    _curResults.value = await searchRepo.searchOnGoogle();
  }
}
