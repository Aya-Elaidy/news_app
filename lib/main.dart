import 'package:flutter/material.dart';
import 'package:news_app/news_app.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:news_app/providers/config_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ConfigProvider()),
      ],
      child: const NewsApp(),
    ),
  );
}
