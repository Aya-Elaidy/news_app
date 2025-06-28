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
    return InkWell(
      onTap: (){
        showAtricleDetails(article,context);
      },
      child: Container(
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
      ),
    );
  }
 void showAtricleDetails(Article article,BuildContext context){
showModalBottomSheet(
  backgroundColor: Colors.transparent,
  isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r)
      )
    ),
    context: context,
    builder:(context){
  return Container(
    decoration: BoxDecoration(color: Colors.white,
    borderRadius: BorderRadius.circular(16.r)),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.all(8),
    child: Column(
      //size of only content 
      mainAxisSize: MainAxisSize.min,
      //ElevatedButton
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl:article.urlToImage ?? "",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Text(article.description??''),
        ElevatedButton(style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          textStyle:Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16.sp)

        ),


            onPressed: (){}, child:
        Text('View Full Article'))

      ],
    ),
  );
});  }
}
















