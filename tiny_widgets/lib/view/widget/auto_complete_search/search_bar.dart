import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';

class SearchBar extends GetView<SearchController> {
  final BorderRadiusGeometry? borderRadius;
  final void Function(String)? onChangedInput;
  final void Function()? onClearedInput;
  final void Function(String)? onSubmittedInput;
  const SearchBar({
    Key? key,
    this.borderRadius,
    this.onChangedInput,
    this.onClearedInput,
    this.onSubmittedInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _inputField();
  }

  Widget _inputField() {
    return Material(
      borderRadius: borderRadius,
      child: TextField(
        controller: controller.keywordController,
        cursorColor: Colors.yellow[800],
        style: Theme.of(Get.context!).textTheme.headline5,
        onChanged: _onChangedInput,
        onSubmitted: _onSubmittedInput,
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
            onPressed: _onClearedInput,
          ),
        ),
      ),
    );
  }

  void _onChangedInput(String input) {
    if (onChangedInput != null) {
      onChangedInput!(input);
    }
  }

  void _onClearedInput() {
    controller.clearTextField();
    if (onClearedInput != null) {
      onClearedInput!();
    }
  }

  void _onSubmittedInput(String input) {
    controller.searchOnGoogle(input);
    if (onSubmittedInput != null) {
      onSubmittedInput!(input);
    }
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
