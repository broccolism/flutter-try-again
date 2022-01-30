import 'package:get/get.dart';
import 'package:tiny_widgets/model/news/news.dart';
import 'package:tiny_widgets/model/news/news_data.dart';

class NewsController extends GetxController {
  final Rx<bool> _isExpanded = false.obs;
  final RxList<ThemeAndArticles> _articles = <ThemeAndArticles>[].obs;

  bool get isExpanded => _isExpanded.value;
  RxList<ThemeAndArticles> get articles => _articles;

  @override
  void onInit() {
    super.onInit();
    _articles.value = [
      ThemeAndArticles(articles: NewsData.cloudArticles, theme: NewsData.cloud),
      ThemeAndArticles(articles: NewsData.nexonArticles, theme: NewsData.nexon),
      ThemeAndArticles(articles: NewsData.techArticles, theme: NewsData.tech),
    ];
  }

  void changeExpandingOption() {
    _isExpanded.value = !_isExpanded.value;
  }
}
