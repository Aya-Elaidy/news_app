import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/models/articles_response/Article.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(width: 1.w, color: ColorsManager.white)
      ),
      child: Column(children: [
        //Image.network(article.urlToImage ?? ""),
        CachedNetworkImage(
          imageUrl:article.urlToImage ?? "",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        SizedBox(height: 10.h,),
        Text(article.title ?? '', style: Theme.of(context).textTheme.titleMedium,),
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(article.author ?? '', style: Theme.of(context).textTheme.titleSmall,),

            Text(article.publishedAt ?? '', style: Theme.of(context).textTheme.titleSmall,),
          ],
        )

      ]),
    );
  }
}
