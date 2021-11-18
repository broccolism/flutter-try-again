import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/src/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _inputField();
  }

  Widget _inputField() {
    return Material(
      borderRadius: BorderRadius.circular(MyConstants.BORDER_RADIUS),
      child: TextField(
        cursorColor: Colors.yellow[800],
        style: Theme.of(Get.context!).textTheme.headline5,
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
