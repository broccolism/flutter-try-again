class ThemeAndArticles {
  final List<Article> articles;
  final NewsTheme theme;

  ThemeAndArticles({required this.articles, required this.theme});
}

class Article {
  final String title;
  final String company;
  final DateTime createdAt;
  final int replyCount;
  final String imageUrl;
  final NewsTheme theme;

  const Article({
    required this.title,
    required this.company,
    required this.createdAt,
    required this.replyCount,
    required this.imageUrl,
    required this.theme,
  });
}

class NewsTheme {
  final int id;
  final String title;

  const NewsTheme({
    required this.id,
    required this.title,
  });
}
