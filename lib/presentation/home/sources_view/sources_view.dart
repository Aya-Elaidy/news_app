import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/articles_response/Article.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/sources_response/Source.dart';
import 'package:news_app/presentation/home/sources_view/article_item.dart';
import 'package:news_app/providers/articles_provider.dart';
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
    // TODO: implement initState
    super.initState();
    loadData();

  }

  void loadData()async{
    sourcesViewProvider = SourcesViewProvider();
    articlesProvider = ArticlesProvider();
    await sourcesViewProvider.loadSources(widget.category);
    articlesProvider.loadArticles(sourcesViewProvider.sources[0]);
  }



  @override
  Widget build(BuildContext context) {
    print(widget.category.title);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewProvider),
        ChangeNotifierProvider.value(value: articlesProvider),
      ],
      child: Column(
        children: [
          Consumer<SourcesViewProvider>(
            builder: (context, sourcesProvider, child) {
              print("Ana da5alt el sources builder");
              List<Source> sources = sourcesProvider.sources;
              return DefaultTabController(
                length: sources.length,
                child: TabBar(
                  onTap: (index) {
                    articlesProvider.loadArticles(sourcesProvider.sources[index]);
                  } ,
                  isScrollable: true,
                  tabs: sources.map((source) => Tab(text: source.name)).toList(),
                ),
              );
            },

          ),
          Consumer<ArticlesProvider>(
              builder: (context, articlesProvider, child){
                print("Ana da5alt el articles builder");
                List<Article> articles = articlesProvider.articles;
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 16.h),
                    itemBuilder:
                        (context, index) => ArticleItem(article:articles [index]),
                    itemCount: articles.length,
                  ),
                );
              }

          ),
        ],
      ),
    );

    // return FutureBuilder(future: ApiServices.getSources(category),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator(),);
    //     }
    //     if(snapshot.hasError){
    //       return Text("Error");
    //     }
    //     List<Source> sources = snapshot.data ?? [];
    //
    //     return  DefaultTabController(
    //               length: sources.length,
    //               child: TabBar(
    //                 isScrollable: true,
    //                 tabs: sources.map((source) => Tab(text: source.name)).toList(),
    //               ));
    //   },);
  }
}
