import 'package:get/get.dart';

class NewsOptionController extends GetxController {
  final Rx<bool> _isExpanded = false.obs;

  bool get isExpanded => _isExpanded.value;

  void changeExpandingOption() {
    _isExpanded.value = !_isExpanded.value;
  }
}
