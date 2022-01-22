import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class DefaultNewsTile extends StatelessWidget {
  const DefaultNewsTile({Key? key}) : super(key: key);

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
      "코인브리핑",
      style: TextStyle(
        color: Colors.indigo,
        fontSize: 20,
      ),
    );
  }

  Widget _mainArticle() {
    return Container();
  }

  Widget _otherArticles() {
    return Container();
  }
}
