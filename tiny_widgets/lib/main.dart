import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/route.dart';
import 'package:tiny_widgets/src/constants.dart';
import 'package:tiny_widgets/view/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MyConstants.APP_NAME,
      home: const HomeScreen(),
      getPages: MyPages.pages,
    );
  }
}
