import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/controller/news/news_controller.dart';
import 'package:tiny_widgets/model/news/news.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class NewsScrollView extends GetView<NewsController> {
  const NewsScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _header(),
        _divider(),
        _option(),
        _divider(),
        _defaultNewsTiles(),
      ],
    );
  }

  Widget _header() {
    return SliverToBoxAdapter(
      child: NewsHeader(),
    );
  }

  Widget _option() {
    return SliverToBoxAdapter(
      child: OptionTile(),
    );
  }

  Widget _defaultNewsTiles() {
    return SliverToBoxAdapter(
      child: Column(
        children: controller.articles
            .map((ThemeAndArticles item) => Column(
                  children: [
                    DefaultNewsTile(theme: item.theme, articles: item.articles),
                    SizedBox(height: 10),
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget _divider() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 10,
      ),
    );
  }
}
