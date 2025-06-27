import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/theme_manager.dart';
import 'package:news_app/core/extensions/context_ex.dart';
import 'package:news_app/core/routes_manager/routes_manager.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.router,
        initialRoute: RoutesManager.home,
        theme: ThemeManager.light ,
        darkTheme: ThemeManager.dark ,
        themeMode: ThemeMode.dark ,
        locale: Locale("en"),

      ),

    );
  }
}
