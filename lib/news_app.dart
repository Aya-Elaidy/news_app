import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/theme_manager.dart';
import 'package:news_app/core/extensions/context_ex.dart';
import 'package:news_app/core/routes_manager/routes_manager.dart';
import 'package:news_app/providers/config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Consumer<ConfigProvider>(
        builder: (context, configProvider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.router,
          initialRoute: RoutesManager.splash,
          theme: ThemeManager.light,
          darkTheme: ThemeManager.dark,
          themeMode: configProvider.currentTheme,
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          locale: Locale(configProvider.currentLang),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        ),
      ),
    );
  }
}
