import 'package:get/get.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/repository/repositories.dart';

class AutocompleteController extends GetxController {
  final SearchRepository searchRepo;
  AutocompleteController({required this.searchRepo});

  late final void Function() _insertOverlay;
  late final void Function() _removeOverlay;
  late final RxString _curInput = "".obs;
  final RxList<GoogleSearch> _curKeywords = <GoogleSearch>[].obs;

  static const int MIN_KEYWORD_LENGTH = 2;

  List<GoogleSearch> get curKeywords => _curKeywords;

  static AutocompleteController get to => Get.find();

  @override
  void onInit() {
    super.onInit();

    debounce(
      _curInput,
      handleKeyword,
      time: Duration(milliseconds: 500),
    );
  }

  void handleKeyword(String input) {
    if (input.isEmpty || input.length < MIN_KEYWORD_LENGTH) {
      _curKeywords.value = [];
    } else if (input.length >= MIN_KEYWORD_LENGTH) {
      _getKeywordsOnGoogle(input);
    }
  }

  void initOverlayHandlers(
      {required void Function() insertOverlay,
      required void Function() removeOverlay}) {
    _insertOverlay = insertOverlay;
    _removeOverlay = removeOverlay;
  }

  Future<void> _getKeywordsOnGoogle(String keyword) async {
    _curKeywords.value = await searchRepo.searchOnGoogle(keyword);
  }
}
