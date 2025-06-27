import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/presentation/home/categories_view/category_item.dart';
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 16.h,),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16.r,),
              itemBuilder:
                  (context, index) =>
                      CategoryItem(category: CategoryModel.categories[index]),
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
