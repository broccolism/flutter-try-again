import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class OptionTile extends GetView<NewsController> {
  const OptionTile({Key? key}) : super(key: key);
  static const String optionTitleText = "헤드라인 뉴스";
  static const String optionText = "펼쳐보기";
  @override
  Widget build(BuildContext context) {
    return NewsTileLayout(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconAndName(),
          _switch(),
        ],
      ),
    );
  }

  Widget _iconAndName() {
    return Row(
      children: const [
        Icon(
          Icons.info_outline,
          color: Colors.grey,
        ),
        SizedBox(width: 2),
        Text(
          optionTitleText,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _switch() {
    return Row(
      children: [
        Text(
          optionText,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(width: 2),
        SizedBox(
          height: 16,
          child: Obx(
            () => Switch(
              value: controller.isExpanded,
              onChanged: (_) => controller.changeExpandingOption(),
            ),
          ),
        ),
      ],
    );
  }
}
