import 'dart:convert';

class GoogleSearch {
  final String title;
  final String link; // full url
  final String displayLink; // abridged url
  final String snippet;
  final String? imageUrl;
  final String? mimeType;

  GoogleSearch({
    required this.title,
    required this.link,
    required this.displayLink,
    required this.mimeType,
    required this.snippet,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'link': link,
      'displayLink': displayLink,
      'mimeType': mimeType,
      'snippet': snippet,
      'imageUrl': imageUrl,
    };
  }

  factory GoogleSearch.fromMap(Map<String, dynamic> map) {
    return GoogleSearch(
      title: map['title'],
      link: map['link'],
      displayLink: map['displayLink'],
      mimeType: map['mimeType'],
      snippet: map['snippet'],
      imageUrl: (map['pagemap']?['cse_image']?[0])?['src'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GoogleSearch.fromJson(String source) =>
      GoogleSearch.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GoogleSearch(\ntitle: $title\nlink: $link\ndisplayLink: $displayLink\nmimeType: $mimeType\nsnippet: $snippet\nimageUrl: $imageUrl\n)';
  }
}
