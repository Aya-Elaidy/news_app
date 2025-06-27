import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/home_drawer.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:provider/provider.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(homeProvider.homeTitle),
      ),
      drawer: HomeDrawer(),
      body:homeProvider.homeView,
    );
  }
}
