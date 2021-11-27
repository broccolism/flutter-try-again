import 'dart:developer';

import 'package:get/get.dart';
import 'package:tiny_widgets/controller/search/search_controller.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/repository/repositories.dart';
import 'package:tiny_widgets/util/utils.dart';

class AutoCompleteController extends GetxController {
  final SearchRepository searchRepo;
  AutoCompleteController({required this.searchRepo});

  late final void Function() _insertOverlay;
  late final void Function() _removeOverlay;
  late final RxString _curInput = "".obs;
  final RxList<GoogleSearch> _curKeywords = <GoogleSearch>[].obs;

  static const int MIN_KEYWORD_LENGTH = 2;

  List<GoogleSearch> get curKeywords => _curKeywords;
  bool get hasKeyword => _curKeywords.isNotEmpty;

  static AutoCompleteController get to => Get.find();

  @override
  void onInit() {
    super.onInit();

    debounce(
      _curInput,
      handleInput,
      time: Duration(milliseconds: 300),
    );
    SearchController.to.addChangeListener(setInput);
  }

  void handleInput(String input) {
    if (input.isEmpty || input.length < MIN_KEYWORD_LENGTH) {
      _curKeywords.value = [];
      _removeOverlay();
    } else if (input.length >= MIN_KEYWORD_LENGTH) {
      _getKeywordsOnGoogle(input);
      _insertOverlay();
    }
  }

  void initOverlayHandlers(
      {required void Function() insertOverlay,
      required void Function() removeOverlay}) {
    _insertOverlay = insertOverlay;
    _removeOverlay = removeOverlay;
  }

  void setInput(String input) {
    _curInput.value = input;
    if (input.isEmpty) {
      _removeOverlay();
    }
  }

  void onTapAutoCompleteItem(GoogleSearch item) {
    SearchController.to.keywordController.text = item.title;
    MyUiUtils.moveTextEditingCursorToBack(
        SearchController.to.keywordController);
    _curKeywords.value = [];
    _removeOverlay();
  }

  Future<void> _getKeywordsOnGoogle(String keyword) async {
    _curKeywords.value = await searchRepo.searchOnGoogle(keyword);
  }
}
