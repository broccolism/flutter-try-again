import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/route.dart';

class HomeScreen extends StatelessWidget {
  static const name = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: MyPages.pages
              .map((GetPage page) => _screenButton(page.name))
              .toList(),
        ),
      ),
    );
  }

  Widget _screenButton(String name) {
    final String buttonName = name
        .substring(1)
        .split("_")
        .map((String word) => word.capitalizeFirst)
        .join(" ");

    return ElevatedButton(
      onPressed: () => Get.toNamed(name),
      child: Text(buttonName),
    );
  }
}
