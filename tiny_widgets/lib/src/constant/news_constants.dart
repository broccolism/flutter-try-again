import 'dart:ui';

import 'package:flutter/material.dart';

class NewsConstants {
  NewsConstants._();

  static const double tilePaddingHorizontal = 12;
  static const double tilePaddingVertical = 20;
  static const TextStyle titleTextStyle = TextStyle(fontSize: 20);
  static const TextStyle companyTextStyle =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w300, color: Colors.grey);

  static const List<String> companyNames = ["매일경제", "연합뉴스", "한국일보", "한국경제"];
}
