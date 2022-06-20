import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:news/models/article.dart';
import 'package:http/http.dart' as http;
//import 'package:news/views/articles.dart';

class News {
  List<Article> news = [];
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=77e8c8dea58143c9a8eb9af8ea72c53f";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null) {
          Article a = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            //publishedAt: element['publishedAt']
          );
          news.add(a);
        }
      });
    }
  }
}

class CatogoryNews {
  List<Article> news = [];
  Future<void> getNews(String catogory) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$catogory&country=in&apiKey=77e8c8dea58143c9a8eb9af8ea72c53f";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null) {
          Article a = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            //publishedAt: element['publishedAt']
          );
          news.add(a);
        }
      });
    }
  }
}
