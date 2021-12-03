import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/src/constant/common_constants.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class SearchResultScreen extends GetView<SearchResultController> {
  static const name = "/search_result_screen";
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            _image(),
            SizedBox(height: 24),
            Padding(
              padding: CommonConstants.SCREEN_HORIZONTAL_MARGIN,
              child: Column(
                children: [
                  _title(),
                  SizedBox(height: 12),
                  _snippetAndLink(),
                  SizedBox(height: 16),
                  _dummyText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Obx(
      () => MyNetworkImage(
        url: controller.result?.imageUrl,
      ),
    );
  }

  Widget _title() {
    return SizedBox(
      width: double.infinity,
      child: Obx(
        () => Text(
          controller.title,
          style: Theme.of(Get.context!).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.w800,
                color: Colors.black,
                letterSpacing: -0.8,
              ),
        ),
      ),
    );
  }

  Widget _snippetAndLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: Get.size.width * 0.4,
          child: Text(
            controller.result?.displayLink ?? "",
            style: Theme.of(Get.context!).textTheme.subtitle2!,
            maxLines: 1,
          ),
        ),
        SizedBox(
          width: Get.size.width * 0.5,
          child: Text(
            controller.result?.snippet ?? "",
            style: Theme.of(Get.context!).textTheme.subtitle2!,
            textAlign: TextAlign.end,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _dummyText() {
    return Text(CommonConstants.DUMMY_TEXT,
        style: Theme.of(Get.context!).textTheme.bodyText2);
  }
}

class SearchResultScreenArgs {
  final GoogleSearch result;

  SearchResultScreenArgs({required this.result});
}
