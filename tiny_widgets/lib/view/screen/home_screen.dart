import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/view/screen/screens.dart';
import 'package:tiny_widgets/view/screen/search_screen.dart';

class HomeScreen extends StatelessWidget {
  static const name = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  static const String OPEN_SEARCH_SCREEN_BUTTON = "Search Screen";
  static const String OPEN_OMOK_SCREEN_BUTTON = "Omok Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(SearchScreen.name),
              child: Text(
                OPEN_SEARCH_SCREEN_BUTTON,
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(OmokScreen.name),
              child: Text(
                OPEN_OMOK_SCREEN_BUTTON,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
