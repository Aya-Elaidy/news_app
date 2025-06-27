import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/articles_response/Article.dart';
import 'package:news_app/models/articles_response/ArticlesResonse.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/sources_response/Source.dart';
import 'package:news_app/models/sources_response/SourcesResponse.dart';

class ApiServices {
  static const String _baseUrl = "newsapi.org";
  static const String _apiKey = "79eae4e1d59f42219904c1e4a146ab74";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";

  static Future<List<Source>> getSources(CategoryModel category) async {
    ///https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    // Uri.parse(
    //   "https://$_baseUrl$_sourcesEndPoint?apiKey=$_apiKey&category=${category.id}",
    // );
    Uri url = Uri.https(_baseUrl, _sourcesEndPoint, {
      "apiKey": _apiKey,
      "category": category.id,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse.sources!;
  }

  static Future<List<Article>> getArticles(Source source) async {
    // https://newsapi.org/v2/everything?q=bitcoin&apiKey=79eae4e1d59f42219904c1e4a146ab74

    Uri url = Uri.https(_baseUrl, articlesEndPoint, {
      "apiKey": _apiKey,
      "sources": source.id,

    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    ArticlesResonse articlesResponse = ArticlesResonse.fromJson(json);
   return articlesResponse.articles!;
  }
}
