import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/src/constant/constants.dart';

class NewsTileLayout extends StatelessWidget {
  const NewsTileLayout({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: NewsConstants.tilePaddingHorizontal,
        vertical: NewsConstants.tilePaddingVertical,
      ),
      color: Colors.white,
      child: child,
    );
  }
}
