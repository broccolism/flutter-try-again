import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 1,
          color: Colors.grey[400],
        ),
        SizedBox(height: 12)
      ],
    );
  }
}
