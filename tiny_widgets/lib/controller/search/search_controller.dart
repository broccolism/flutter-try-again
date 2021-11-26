import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/repository/search_repository.dart';
import 'package:tiny_widgets/util/ui.dart';

class SearchController extends GetxController {
  final SearchRepository searchRepo;
  SearchController({required this.searchRepo});

  late final TextEditingController _keywordController = TextEditingController();
  final RxList<GoogleSearch> _curResults = <GoogleSearch>[].obs;

  TextEditingController get keywordController => _keywordController;
  bool get hasResult => _curResults.isNotEmpty;
  static SearchController get to => Get.find();

  @override
  void onClose() {
    _keywordController.dispose();
    super.onClose();
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

  // TODO: ENTER 쳤을 때 실행
  Future<void> _searchOnGoogle(String keyword) async {
    _curResults.value = await searchRepo.searchOnGoogle(keyword);
  }
}
