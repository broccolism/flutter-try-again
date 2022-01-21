import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/controllers.dart';

class OptionTile extends GetView<NewsOptionController> {
  const OptionTile({Key? key}) : super(key: key);
  static const String optionTitleText = "헤드라인 뉴스";
  static const String optionText = "펼쳐보기";
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _iconAndName(),
        _switch(),
      ],
    );
  }

  Widget _iconAndName() {
    return Row(
      children: const [
        Icon(
          Icons.info_outline,
        ),
        SizedBox(width: 2),
        Text(optionTitleText),
      ],
    );
  }

  Widget _switch() {
    return Row(
      children: [
        Text(optionText),
        SizedBox(width: 2),
        Obx(
          () => Switch(
            value: controller.isExpanded,
            onChanged: (_) => controller.changeExpandingOption(),
          ),
        ),
      ],
    );
  }
}
