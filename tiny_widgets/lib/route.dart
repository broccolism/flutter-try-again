import 'package:get/route_manager.dart';
import 'package:tiny_widgets/view/screen/screens.dart';
import 'binding/bindings.dart';

class MyPages {
  // MyPages._();

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
    GetPage(
      name: ImplicitAnimationScreen.name,
      page: () => const ImplicitAnimationScreen(),
    ),
    GetPage(
      name: TransitionAnimationScreen.name,
      page: () => const TransitionAnimationScreen(),
    ),
    GetPage(
      name: ExplicitAnimationScreen.name,
      page: () => const ExplicitAnimationScreen(),
    ),
    GetPage(
      name: PhotoScreen.name,
      page: () => const PhotoScreen(),
    ),
    GetPage(
      name: NewsScreen.name,
      page: () => const NewsScreen(),
      binding: NewsBinding(),
    ),
  ];
}
