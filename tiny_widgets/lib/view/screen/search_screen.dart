import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/src/constants.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class SearchScreen extends GetView<SearchController> {
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
            child: AutoCompleteSearchBar(),
          ),
          ..._colorFields(reversed: true),
          _searchResults(),
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

  Widget _searchResults() {
    return Container(
      padding: MyConstants.SCREEN_HORIZONTAL_MARGIN,
      color: Colors.white,
      child: Obx(
        () => Column(
          children: controller.curResults
              .map((GoogleSearch result) => _resultItemBuilder(result))
              .toList(),
        ),
      ),
    );
  }

  Widget _resultItemBuilder(GoogleSearch result) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            result.title,
            style: Theme.of(Get.context!).textTheme.headline5,
          ),
          SizedBox(height: 4),
          Text(
            result.displayLink ?? "no link",
            style: Theme.of(Get.context!).textTheme.headline6!.copyWith(
                  color: Colors.lightBlue[900],
                  fontWeight: FontWeight.w300,
                ),
          ),
        ],
      ),
    );
  }
}
