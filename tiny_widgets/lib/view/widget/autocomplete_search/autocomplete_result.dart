import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/src/constants.dart';

class AutoCompleteResult extends GetView<SearchBarController> {
  const AutoCompleteResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Obx(
        () => controller.curResults.isNotEmpty
            ? ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.curResults.length,
                itemBuilder: _itemBuilder,
                separatorBuilder: _separatorBuilder,
              )
            : SizedBox(),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () =>
          controller.onTapAutocompleteItem(controller.curResults[index]),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: MyConstants.SCREEN_HORIZONTAL_MARGIN.left),
        child: Text(
          controller.curResults[index].name,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _separatorBuilder(BuildContext _, int __) {
    return Divider(
      thickness: 1,
      height: 1,
      indent: MyConstants.SCREEN_HORIZONTAL_MARGIN.left,
      endIndent: MyConstants.SCREEN_HORIZONTAL_MARGIN.left,
      color: Colors.grey[300],
    );
  }
}
