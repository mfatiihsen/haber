import 'package:flutter/cupertino.dart';
import 'package:haber/model/source_model.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? "Yazar Bulunamadı",
      title: json['title'],
      description: json['description'] ?? "Açıklama Girilmedi",
      url: json['url'] ?? "Url Girilmedi",
      urlToImage: json['urlToImage'] ?? AssetImage("assets/images/haber.png"),
      publishedAt: json['publishedAt'] ?? "Zaman Girilmedi",
      content: json['content'] ?? "Bağlantı Bulunamadı",
    );
  }
}
