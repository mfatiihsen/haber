import 'dart:convert';

import 'package:haber/model/artide_models.dart';
import 'package:http/http.dart';

class ApiService {
  final endPointUrl = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=tr&apiKey=93de95d3f01047b1b686b6d38a79adae");

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json["articles"];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception("Cant get the articles");
    }
  }
}
