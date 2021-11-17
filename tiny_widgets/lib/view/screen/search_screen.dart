import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/src/constants.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class SearchScreen extends StatelessWidget {
  static const name = "/search_screen";
  const SearchScreen({Key? key}) : super(key: key);

  static const int TOTAL_COLOR_COUNT = 4;
  static const int COLOR_INDEX_STEP = 100;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _colorFieldsAndSearchBar(),
    );
  }

  Widget _colorFieldsAndSearchBar() {
    return Container(
      color: Colors.lightBlue[400],
      child: Column(
        children: [
          ..._colorFields(),
          Container(
            margin: MyConstants.SCREEN_HORIZONTAL_MARGIN,
            child: SearchBar(),
          ),
          ..._colorFields(reversed: true),
        ],
      ),
    );
  }

  List<Widget> _colorFields({bool reversed = false}) {
    return List<int>.generate(TOTAL_COLOR_COUNT, (i) => i + 1).map((int i) {
      int digit = reversed ? TOTAL_COLOR_COUNT - (i - 1) : i;
      return Container(
        width: double.infinity,
        height: digit * 60,
        color: Colors.lightBlue[digit * COLOR_INDEX_STEP],
      );
    }).toList();
  }
}
