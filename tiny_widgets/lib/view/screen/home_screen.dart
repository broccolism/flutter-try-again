import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/view/screen/dropdown_screen.dart';

class HomeScreen extends StatelessWidget {
  static const name = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  static const String OPEN_OVERLAY_ENTRY_BUTTON = "OverlayEntry";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(DropdownScreen.name),
              child: Text(
                OPEN_OVERLAY_ENTRY_BUTTON,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
