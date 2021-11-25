import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleSearch {
  final String title;
  final String? link; // full url
  final String? displayLink; // abridged url
  final String? mimeType;

  GoogleSearch(
      {required this.title,
      required this.link,
      required this.displayLink,
      required this.mimeType});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'link': link,
      'displayLink': displayLink,
      'mimeType': mimeType,
    };
  }

  factory GoogleSearch.fromMap(Map<String, dynamic> map) {
    return GoogleSearch(
      title: map['title'],
      link: map['link'],
      displayLink: map['displayLink'],
      mimeType: map['mimeType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GoogleSearch.fromJson(String source) =>
      GoogleSearch.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GoogleSearch(title: $title, link: $link, displayLink: $displayLink, mimeType: $mimeType)';
  }
}
