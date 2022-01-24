import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/src/constant/news_constants.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class DefaultNewsTile extends StatelessWidget {
  final NewsTheme theme;
  final List<Article> articles;

  const DefaultNewsTile({
    Key? key,
    required this.theme,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewsTileLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          _mainArticle(),
          _otherArticles(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      theme.title,
      style: TextStyle(
        color: Colors.indigo,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _mainArticle() {
    Article article = articles.first;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 12, top: 12, bottom: 12),
          width: Get.width * 0.35,
          child: CachedNetworkImage(
            imageUrl: article.imageUrl,
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: NewsConstants.titleTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                article.company,
                style: NewsConstants.companyTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _otherArticles() {
    return Container();
  }
}
