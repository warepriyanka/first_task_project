import 'dart:convert';

List<ArticleModel> newsFromJson(String str) =>
    List<ArticleModel>.from(json.decode(str).map((x) => ArticleModel.fromJson(x)));

String newsToJson(List<ArticleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  ArticleModel({
    required this.title,
    required this.description,
    required this.author,
    required this.content,
    required this.url,
    required this.urlToImage,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    title: json["title"],
    description: json["description"],
    author: json["author"],
    content: json["content"],
    url: json["url"],
    urlToImage: json["urlToImage"]
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "author": author,
    "content": content,
    "url": url,
    "urlToImage": urlToImage
  };
}
