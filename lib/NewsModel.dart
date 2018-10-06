// To parse this JSON data, do
//
//     final newsList = newsListFromJson(jsonString);

import 'dart:convert';

List<Article> newsListFromJson(String str) {
  final jsonData = json.decode(str);
  NewsList newsList = NewsList.fromJson(jsonData);
  return newsList.articles;
}

String newsListToJson(NewsList data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
class NewsList {
  String status;
  String source;
  String sortBy;
  List<Article> articles;

  NewsList({
    this.status,
    this.source,
    this.sortBy,
    this.articles,
  });

  factory NewsList.fromJson(Map<String, dynamic> json) => new NewsList(
    status: json["status"],
    source: json["source"],
    sortBy: json["sortBy"],
    articles: new List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "source": source,
    "sortBy": sortBy,
    "articles": new List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) => new Article(
    author: json["author"] == null ? null : json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: json["publishedAt"],
  );

  Map<String, dynamic> toJson() => {
    "author": author == null ? null : author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt,
  };
}
