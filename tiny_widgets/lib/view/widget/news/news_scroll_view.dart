import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/model/models.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class NewsScrollView extends StatelessWidget {
  const NewsScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _header(),
        _divider(),
        _option(),
        _divider(),
        _defaultNewsTile(),
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

  Widget _defaultNewsTile() {
    return SliverToBoxAdapter(
      child: DefaultNewsTile(
        theme: NewsData.cloud,
        articles: NewsData.cloudArticles,
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
