import 'package:get/route_manager.dart';
import 'package:tiny_widgets/view/screen/home_screen.dart';
import 'package:tiny_widgets/view/screen/screens.dart';

import 'binding/bindings.dart';

class MyPages {
  MyPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: HomeScreen.name,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: SearchScreen.name,
      page: () => const SearchScreen(),
      binding: SearchBarBinding(),
    ),
    GetPage(
      name: SearchResultScreen.name,
      page: () => const SearchResultScreen(),
      binding: SearchResultBinding(),
    ),
    GetPage(
      name: OmokScreen.name,
      page: () => const OmokScreen(),
      binding: OmokBinding(),
    ),
  ];
}
