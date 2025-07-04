import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/providers/config_provider.dart';
import 'package:provider/provider.dart';

class CategoryModel {
  final String id;
  final String title;
  final String imagePath;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.imagePath,
  });

  static List<CategoryModel> getCategories(BuildContext context) {
    final isDark = Provider.of<ConfigProvider>(context, listen: true).isDark;
    final local = AppLocalizations.of(context)!;

    return [
      CategoryModel(
        id: "sports",
        title: local.sports,
        imagePath: isDark ? AssetsManager.sports : AssetsManager.sportsDark,
      ),
      CategoryModel(
        id: "entertainment",
        title: local.entertainment,
        imagePath: isDark ? AssetsManager.entertainment : AssetsManager.entertainmentDark,
      ),
      CategoryModel(
        id: "business",
        title: local.business,
        imagePath: isDark ? AssetsManager.business : AssetsManager.businessDark,
      ),
      CategoryModel(
        id: "science",
        title: local.science,
        imagePath: isDark ? AssetsManager.science : AssetsManager.scienceDark,
      ),
      CategoryModel(
        id: "technology",
        title: local.technology,
        imagePath: isDark ? AssetsManager.tech : AssetsManager.techDark,
      ),
      CategoryModel(
        id: "health",
        title: local.health,
        imagePath: isDark ? AssetsManager.health : AssetsManager.healthDark,
      ),
      CategoryModel(
        id: "general",
        title: local.general,
        imagePath: isDark ? AssetsManager.general : AssetsManager.generalDark,
      ),
    ];
  }

}
