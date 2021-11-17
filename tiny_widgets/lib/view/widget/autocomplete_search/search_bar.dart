import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 2,
          ),
          border: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(),
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
