import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/src/constants.dart';

class SearchBar extends GetView<SearchController> {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _inputField();
  }

  Widget _inputField() {
    return Obx(
      () => Material(
        borderRadius: controller.hasResult
            ? BorderRadius.only(
                topLeft: Radius.circular(MyConstants.BORDER_RADIUS),
                topRight: Radius.circular(MyConstants.BORDER_RADIUS),
              )
            : BorderRadius.circular(MyConstants.BORDER_RADIUS),
        child: TextField(
          controller: controller.keywordController,
          cursorColor: Colors.yellow[800],
          style: Theme.of(Get.context!).textTheme.headline5,
          onSubmitted: controller.searchOnGoogle,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            enabledBorder: _noBorder(),
            focusedBorder: _borderBottomOnly(),
            prefixIcon: Icon(
              CupertinoIcons.search,
            ),
            suffixIcon: IconButton(
              color: Colors.blueGrey[300],
              icon: Icon(CupertinoIcons.clear),
              onPressed: controller.clearTextField,
            ),
          ),
        ),
      ),
    );
  }

  InputBorder _noBorder() {
    return InputBorder.none;
  }

  InputBorder _borderBottomOnly() {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueGrey[200]!,
      ),
    );
  }
}
