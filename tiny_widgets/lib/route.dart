import 'package:get/route_manager.dart';
import 'package:tiny_widgets/view/screen/home_screen.dart';

class MyPages {
  MyPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: HomeScreen.name,
      page: () => const HomeScreen(),
    ),
  ];
}
