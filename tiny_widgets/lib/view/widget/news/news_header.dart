import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsHeader extends StatelessWidget {
  const NewsHeader({Key? key}) : super(key: key);
  static const String logoText = "N";
  static const String titleText = "뉴스";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[800],
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _logo(),
            SizedBox(width: 12),
            _title(),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Text(
      logoText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _title() {
    return Text(
      titleText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
