import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsHeader extends StatelessWidget {
  const NewsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[800],
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "N",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Text(
            "뉴스",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
