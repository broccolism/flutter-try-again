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
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: Get.height * 2),
          child: Column(
            children: [
              SizedBox(height: 640),
              _searchBar(),
              SizedBox(height: MyConstants.SCREEN_HORIZONTAL_MARGIN.left),
              _searchResults(),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: MyConstants.SCREEN_HORIZONTAL_MARGIN,
      child: AutoCompleteSearchBar(),
    );
  }

  Widget _searchResults() {
    return Container(
      padding: MyConstants.SCREEN_HORIZONTAL_MARGIN,
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
            style: Theme.of(Get.context!).textTheme.headline6!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
          ),
          SizedBox(height: 4),
          Text(
            result.displayLink ?? "no link",
            style: Theme.of(Get.context!).textTheme.button!.copyWith(
                  color: Colors.blue[100],
                  fontWeight: FontWeight.w300,
                ),
          ),
        ],
      ),
    );
  }
}
