import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';

class AutoCompleteResult extends GetView<SearchBarController> {
  const AutoCompleteResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: controller.curResults.length,
        itemBuilder: _itemBuilder,
        separatorBuilder: _separatorBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        log("'${controller.curResults[index].name}' tapped.",
            name: "AutocompleteResult._itemBuilder");
      },
      child: Container(
        color: Colors.white,
        child: Text(
          controller.curResults[index].name,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _separatorBuilder(BuildContext _, int __) {
    return Container(
      width: Get.width * 0.6,
      height: 2,
      color: Colors.grey[300],
    );
  }
}
