import 'package:flutter/material.dart';

class MyUiUtils {
  MyUiUtils._();

  static void moveTextEditingCursorToFront(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(TextPosition(offset: 0));
  }

  static void moveTextEditingCursorToBack(TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
  }
}
