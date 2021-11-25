import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/repository/search_repository.dart';
import 'package:tiny_widgets/util/ui.dart';

class SearchBarController extends GetxController {
  final SearchRepository searchRepo;
  SearchBarController({required this.searchRepo});

  late final void Function() _insertOverlay;
  late final void Function() _removeOverlay;
  late final TextEditingController _keywordController = TextEditingController();
  late final RxString _curKeyword = "".obs;
  final RxList<GoogleSearch> _curResults = <GoogleSearch>[].obs;

  static const int MIN_KEYWORD_LENGTH = 2;

  TextEditingController get keywordController => _keywordController;
  List<GoogleSearch> get curResults => _curResults;
  bool get hasResult => _curResults.isNotEmpty;
  static SearchBarController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    debounce(
      _curKeyword,
      handleKeyword,
      time: Duration(milliseconds: 500),
    );
  }

  @override
  void onClose() {
    _keywordController.dispose();
    super.onClose();
  }

  void handleKeyword(String input) {
    if (input.isEmpty || input.length < MIN_KEYWORD_LENGTH) {
      _curResults.value = [];
      _removeOverlay();
    } else if (input.length >= MIN_KEYWORD_LENGTH) {
      searchOnGoogle(input);
      _insertOverlay();
    }
  }

  void initOverlayHandlers(
      {required void Function() insertOverlay,
      required void Function() removeOverlay}) {
    _insertOverlay = insertOverlay;
    _removeOverlay = removeOverlay;
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
    _curResults.value = await searchRepo.searchOnGoogle(keyword);
  }
}
