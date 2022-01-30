import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/src/constant/constants.dart';

class NewsTileLayout extends StatelessWidget {
  final bool hasBottomDivider;
  final bool hasPadding;
  final Widget child;

  const NewsTileLayout({
    Key? key,
    required this.child,
    this.hasPadding = true,
    this.hasBottomDivider = true,
  }) : super(key: key);

  static const double bottomDividerHeight = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: hasPadding
          ? EdgeInsets.symmetric(
              horizontal: NewsConstants.tilePaddingHorizontal,
              vertical: NewsConstants.tilePaddingVertical,
            )
          : EdgeInsets.zero,
      margin: hasBottomDivider
          ? EdgeInsets.only(bottom: bottomDividerHeight)
          : null,
      color: Colors.white,
      child: child,
    );
  }
}
