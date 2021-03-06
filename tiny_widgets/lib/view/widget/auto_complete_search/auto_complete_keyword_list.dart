import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/src/constant/common_constants.dart';

class AutoCompleteKeywordList extends GetView<AutoCompleteController> {
  const AutoCompleteKeywordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 340,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(CommonConstants.BORDER_RADIUS),
        ),
      ),
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: controller.curKeywords.length,
          itemBuilder: _itemBuilder,
          separatorBuilder: _separatorBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () =>
          controller.onTapAutoCompleteItem(controller.curKeywords[index]),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: CommonConstants.SCREEN_HORIZONTAL_MARGIN.left),
        child: Text(
          controller.curKeywords[index].title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _separatorBuilder(BuildContext _, int __) {
    return Divider(
      thickness: 1,
      height: 1,
      indent: CommonConstants.SCREEN_HORIZONTAL_MARGIN.left,
      endIndent: CommonConstants.SCREEN_HORIZONTAL_MARGIN.left,
      color: Colors.grey[300],
    );
  }
}
