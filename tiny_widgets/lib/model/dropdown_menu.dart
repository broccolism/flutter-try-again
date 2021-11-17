import 'package:flutter/material.dart';

class DropdownMenuItem {
  final String name;
  final Icon icon;

  DropdownMenuItem({
    required this.name,
    required this.icon,
  });

  @override
  String toString() => 'DropdownMenuItem(name: $name, icon: $icon)';
}
