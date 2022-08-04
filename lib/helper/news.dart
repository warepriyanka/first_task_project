import 'package:first_task_project/models/article_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {


    var response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=ng&category=general&apiKey=cd5b96d8fd5b45bc8564c1e806208a04'));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null && element['author'] != null
            && element['title'] != null  && element['url'] != null && element['content'] != null) {
          //
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            author: element['author'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);
        }
      });

    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {

    var response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=ng&category=general&apiKey=cd5b96d8fd5b45bc8564c1e806208a04'));


    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null && element['author'] != null
            && element['title'] != null  && element['url'] != null && element['content'] != null) {
          //
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

