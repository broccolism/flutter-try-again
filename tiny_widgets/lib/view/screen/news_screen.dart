import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class NewsScreen extends StatelessWidget {
  static const name = "/news_screen";
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsScrollView(),
    );
  }
}
