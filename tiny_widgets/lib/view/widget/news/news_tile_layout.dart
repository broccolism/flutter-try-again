import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/src/constant/constants.dart';

class NewsTileLayout extends StatelessWidget {
  final bool hasBottomDivider;
  final Widget child;

  const NewsTileLayout({
    Key? key,
    required this.child,
    this.hasBottomDivider = true,
  }) : super(key: key);

  static const double bottomDividerHeight = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: NewsConstants.tilePaddingHorizontal,
        vertical: NewsConstants.tilePaddingVertical,
      ),
      margin: hasBottomDivider
          ? EdgeInsets.only(bottom: bottomDividerHeight)
          : null,
      color: Colors.white,
      child: child,
    );
  }
}
