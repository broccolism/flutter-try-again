import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/model/models.dart';

class SearchResultScreen extends GetView<SearchResultController> {
  static const name = "/search_result_screen";
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            controller.title,
            style: Theme.of(Get.context!).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}

class SearchResultScreenArgs {
  final GoogleSearch result;

  SearchResultScreenArgs({required this.result});
}
