import 'package:tiny_widgets/model/models.dart';

class NewsData {
  NewsData._();
  static final nexon = NewsTheme(id: 0, title: "넥슨 의정부리듬시티 프로젝트 참여");
  static final cloud = NewsTheme(id: 1, title: "주간 클라우드 동향");
  static final tech = NewsTheme(id: 2, title: "IT클로즈업");

  static final List<Article> nexonArticles = [
    Article(
      title: "넥슨, 네이버와 만든 합작법인에 150억원 출자",
      company: "조선비즈",
      createdAt: DateTime.now(),
      replyCount: 0,
      imageUrl:
          "https://cdn.hellodd.com/news/photo/202201/95571_310186_052.jpg",
      theme: nexon,
    ),
    Article(
      title: "넷플릭스 하청 기지 한국...정부, 배달비 비교",
      company: "아이뉴스24",
      createdAt: DateTime.now(),
      replyCount: 0,
      imageUrl:
          "https://cdn.hellodd.com/news/photo/202201/95571_310186_052.jpg",
      theme: nexon,
    ),
    Article(
      title: "넥슨, 네이버 문화 콘텐츠 합작법인에 150억원 투자",
      company: "한국일보",
      createdAt: DateTime.now(),
      replyCount: 0,
      imageUrl:
          "https://cdn.hellodd.com/news/photo/202201/95571_310186_052.jpg",
      theme: nexon,
    ),
    Article(
      title: "넥슨, 네이버 등 5개사와 JV 결성.. 150억 ",
      company: "파이낸셜뉴스",
      createdAt: DateTime.now(),
      replyCount: 0,
      imageUrl:
          "https://cdn.hellodd.com/news/photo/202201/95571_310186_052.jpg",
      theme: nexon,
    ),
  ];

  static final List<Article> cloudArticles = [
    Article(
        title: "[주간 클라우드 동향/1월4] 클라우드 바우처 사업, 기업 디지털 전환으로",
        company: "디지털데일리",
        createdAt: DateTime.now(),
        replyCount: 0,
        imageUrl:
            "https://cdn.nextdaily.co.kr/news/photo/202201/202701_302826_443.jpg",
        theme: cloud),
    Article(
        title: "[주간 클라우드 동향/1월3] 한 해 농사 준비 중인",
        company: "디지털데일리",
        createdAt: DateTime.now(),
        replyCount: 0,
        imageUrl:
            "https://cdn.nextdaily.co.kr/news/photo/202201/202701_302826_443.jpg",
        theme: cloud),
    Article(
        title: "[주간 클라우드 동향/1월2] 입모아 '클라우드'",
        company: "디지털데일리",
        createdAt: DateTime.now(),
        replyCount: 0,
        imageUrl:
            "https://cdn.nextdaily.co.kr/news/photo/202201/202701_302826_443.jpg",
        theme: cloud),
    Article(
        title: "[주간 클라우드 동향/1월1] 호랑이 등에 올라탄 감자",
        company: "디지털데일리",
        createdAt: DateTime.now(),
        replyCount: 0,
        imageUrl:
            "https://cdn.nextdaily.co.kr/news/photo/202201/202701_302826_443.jpg",
        theme: cloud),
  ];

  static final List<Article> techArticles = [
    Article(
        title: "[IT클로즈업] IPO 앞둔 마켓컬리, 갑질 의혹 등 연이은 악재 '시끌시끌'",
        company: "디지털데일리",
        createdAt: DateTime.now(),
        replyCount: 0,
        imageUrl:
            "https://www.ddaily.co.kr/data/photos/cdn/20220104/art_1642979646.jpg",
        theme: tech),
    Article(
        title: "미국, 반도체 '한국/대만' 집중 해소",
        company: "디지털데일리",
        createdAt: DateTime.now(),
        replyCount: 0,
        imageUrl:
            "https://www.ddaily.co.kr/data/photos/cdn/20220104/art_1642979646.jpg",
        theme: tech),
    Article(
        title: "'일본 시대 끝났다'...꿈의 영업이익",
        company: "디지털데일리",
        createdAt: DateTime.now(),
        replyCount: 0,
        imageUrl:
            "https://www.ddaily.co.kr/data/photos/cdn/20220104/art_1642979646.jpg",
        theme: tech),
    Article(
        title: "'김범수 믿을맨' 남궁훈, 위기의 카카오",
        company: "디지털데일리",
        createdAt: DateTime.now(),
        replyCount: 0,
        imageUrl:
            "https://www.ddaily.co.kr/data/photos/cdn/20220104/art_1642979646.jpg",
        theme: tech),
  ];
}
