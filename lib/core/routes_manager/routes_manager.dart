import 'package:flutter/cupertino.dart';
import 'package:news_app/presentation/home/home.dart';
import 'package:news_app/presentation/splash/splash.dart';

class RoutesManager{
  static const String splash = "/splash";

  static const String home = "/home";
  static const String search = "/search";
  static Route? router(RouteSettings settings){
    switch (settings.name) {
      case home:
        return CupertinoPageRoute(builder: (context) => const Home(),);

      case splash:
        return CupertinoPageRoute(builder: (context) => const Splash(),);
    }
    return null;
  }
}