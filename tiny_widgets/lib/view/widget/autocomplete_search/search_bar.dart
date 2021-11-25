import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/src/constants.dart';

class SearchBar extends GetView<SearchBarController> {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _inputField();
  }

  Widget _inputField() {
    return Material(
      borderRadius: BorderRadius.circular(MyConstants.BORDER_RADIUS),
      child: TextField(
        controller: controller.keywordController,
        cursorColor: Colors.yellow[800],
        style: Theme.of(Get.context!).textTheme.headline5,
        onChanged: controller.handleKeyword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 2,
          ),
          border: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(),
          prefixIcon: Icon(
            CupertinoIcons.search,
          ),
          suffixIcon: IconButton(
            color: Colors.blueGrey[300],
            icon: Icon(CupertinoIcons.clear),
            onPressed: controller.onClearTextField,
          ),
        ),
      ),
    );
  }

  InputBorder _border() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(MyConstants.BORDER_RADIUS),
    );
  }
}
