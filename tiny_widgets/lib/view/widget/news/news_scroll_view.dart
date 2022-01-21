import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class NewsScrollView extends StatelessWidget {
  const NewsScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _header(),
      ],
    );
  }

  Widget _header() {
    return SliverToBoxAdapter(
      child: NewsHeader(),
    );
  }
}
