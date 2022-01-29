import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/src/constant/news_constants.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class SubscriptionTile extends StatelessWidget {
  const SubscriptionTile({Key? key}) : super(key: key);

  static const title = "보고싶은 언론사를 쉽게 구독해보세요 >";
  static const refreshButtonText = "새로 추천";
  static const subscriptionButtonText = "언론사 4개 구독";

  @override
  Widget build(BuildContext context) {
    return NewsTileLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          SizedBox(height: 16),
          _companyTiles(),
          SizedBox(height: 20),
          _buttons(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _companyTiles() {
    return Wrap(
      spacing: 14,
      children: NewsConstants.companyNames
          .map((String name) => _checkedTile(name))
          .toList(),
    );
  }

  Widget _buttons() {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _linedButton(
              color: Colors.grey,
              text: refreshButtonText,
              icon: CupertinoIcons.refresh),
          SizedBox(width: 6),
          _linedButton(
              color: Colors.green,
              text: subscriptionButtonText,
              icon: CupertinoIcons.checkmark_alt),
        ],
      ),
    );
  }

  Widget _checkedTile(String companyName) {
    return Container(
      width: Get.size.width * 0.21,
      height: Get.size.width * 0.21,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[200]!,
        ),
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(companyName),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: Icon(
              CupertinoIcons.checkmark_alt_circle_fill,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _linedButton(
      {required IconData icon, required String text, required Color color}) {
    return Container(
      width: 140,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: color,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 20,
            ),
            Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 18,
                letterSpacing: -2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
