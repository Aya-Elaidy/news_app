import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/models/articles_response/Article.dart';
import 'package:news_app/providers/config_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ConfigProvider>(context).isDark;

    return InkWell(
      onTap: (){
        showAtricleDetails(article,context);
      },
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDark?ColorsManager.black17:Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(width: 1.w, color: isDark? ColorsManager.white:ColorsManager.black17)
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
      final isDark = Provider.of<ConfigProvider>(context).isDark;

      return Container(

  decoration: BoxDecoration(color:isDark? Colors.white:ColorsManager.black17,
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
        Text(article.description??'',style: TextStyle(color: isDark?Colors.black:Colors.white),),
        ElevatedButton(style: ElevatedButton.styleFrom(
          backgroundColor: isDark?Colors.black:Colors.white,
          foregroundColor: isDark?Colors.white:Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          textStyle:Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16.sp)

        ),


            onPressed: (){
          _lunchUrl(article.url??'');
            }, child:
       Text(AppLocalizations.of(context)!.view_full_article))

      ],
    ),
  );
});  }

  void _lunchUrl(String url) async{
    Uri uri=Uri.parse(url);
    if(await canLaunchUrl(uri)){
     await launchUrl(uri,mode:LaunchMode.inAppWebView);

    }
  }
}
















