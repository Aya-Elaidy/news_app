import 'package:flutter/material.dart';
import 'package:news_app/api_services/api_services.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/sources_response/Source.dart';
class SourcesViewProvider extends ChangeNotifier{
  List<Source> sources = [];


  Future<void> loadSources(CategoryModel category)async{
    sources =await  ApiServices.getSources(category);
    notifyListeners();
  }


}