import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResult {
  final String name;
  final Icon icon;

  SearchResult({
    required this.name,
    required this.icon,
  });

  @override
  String toString() => 'SearchResult(name: $name, icon: $icon)';

  static SearchResult get sample => SearchResult(
        name: "sample search result",
        icon: Icon(CupertinoIcons.burn),
      );
}
