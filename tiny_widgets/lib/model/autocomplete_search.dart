import 'package:flutter/material.dart';

class SearchResultItem {
  final String name;
  final Icon icon;

  SearchResultItem({
    required this.name,
    required this.icon,
  });

  @override
  String toString() => 'SearchResultItem(name: $name, icon: $icon)';
}
