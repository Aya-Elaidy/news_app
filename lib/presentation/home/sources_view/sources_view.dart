import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/articles_response/Article.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/sources_response/Source.dart';
import 'package:news_app/presentation/home/sources_view/article_item.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/providers/config_provider.dart';
import 'package:news_app/providers/sources_view_provider.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
   SourcesView({super.key, required this.category});
  final CategoryModel category;


  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewProvider sourcesViewProvider;
  late ArticlesProvider articlesProvider;


  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    sourcesViewProvider = SourcesViewProvider();
    articlesProvider = ArticlesProvider();
    await sourcesViewProvider.loadSources(widget.category);
    articlesProvider.loadArticles(sourcesViewProvider.sources[0]);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ConfigProvider>(context).isDark;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewProvider),
        ChangeNotifierProvider.value(value: articlesProvider),
      ],
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Consumer<SourcesViewProvider>(
              builder: (context, sourcesProvider, child) {
                List<Source> sources = sourcesProvider.sources;

                return DefaultTabController(
                  length: sources.length,
                  child: TabBar(
                    onTap: (index) {
                      articlesProvider.loadArticles(sourcesProvider.sources[index]);
                    },
                    isScrollable: true,
                    labelColor:isDark?Colors.white:Colors.black,
                    unselectedLabelColor: isDark ? Colors.grey[400] : Colors.grey[700],
                    indicatorColor: isDark?Colors.white:Colors.black,
                    tabs: sources.map((source) => Tab(text: source.name)).toList(),
                  ),
                );
              },
            ),
            Consumer<ArticlesProvider>(
              builder: (context, articlesProvider, child) {
                List<Article> articles = articlesProvider.articles;
                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16.w),
                    separatorBuilder: (context, index) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) => ArticleItem(article: articles[index]),
                    itemCount: articles.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
