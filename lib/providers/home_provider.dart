import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/presentation/home/categories_view/categories_view.dart';
import 'package:news_app/presentation/home/sources_view/sources_view.dart';

class HomeProvider extends ChangeNotifier{
  /// state -> change -> notify state changes
  Widget homeView = CategoriesView();
  String homeTitle = "Home";

  void changeHomeViewToSources(CategoryModel category){
    homeView = SourcesView(category:category ,);
    homeTitle = category.title;
    notifyListeners();
  }


  void changeHomeViewToCategories(){
    homeView = CategoriesView();
    notifyListeners();
  }
}