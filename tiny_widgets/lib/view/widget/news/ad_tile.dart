import 'package:flutter/widgets.dart';
import 'package:tiny_widgets/view/widget/widgets.dart';

class AdTile extends StatelessWidget {
  const AdTile({Key? key}) : super(key: key);

  static const String imageName = "assets/images/news_ad.png";
  @override
  Widget build(BuildContext context) {
    return NewsTileLayout(
      hasPadding: false,
      child: Image.asset(
        imageName,
      ),
    );
  }
}
