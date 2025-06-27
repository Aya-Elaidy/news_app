import 'package:flutter/material.dart';
import 'package:news_app/api_services/api_services.dart';
import 'package:news_app/models/articles_response/Article.dart';
import 'package:news_app/models/sources_response/Source.dart';

class ArticlesProvider extends ChangeNotifier{
  List<Article> articles = [];
  void loadArticles(Source source)async{
    articles = await ApiServices.getArticles(source);
    notifyListeners();

  }
}