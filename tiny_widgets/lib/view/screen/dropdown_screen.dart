import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropdownScreen extends StatelessWidget {
  static const name = "/dropdown_screen";
  const DropdownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _background(),
    );
  }

  Widget _background() {
    return Column(
      children: List<int>.generate(8, (i) => i + 1)
          .map(
            (int index) => Container(
              width: double.infinity,
              height: index * 60,
              color: Colors.lightBlue[index * 100],
            ),
          )
          .toList(),
    );
  }
}
