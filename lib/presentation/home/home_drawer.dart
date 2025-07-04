import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/extensions/context_ex.dart';
import 'package:news_app/providers/config_provider.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/home_provider.dart';



class HomeDrawer extends StatefulWidget {
 const  HomeDrawer({super.key});


  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  late ConfigProvider configProvider;

  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);


    var homeProvider = Provider.of<HomeProvider>(context);
    return Drawer(
      width: context.width * 0.7,
      backgroundColor: ColorsManager.black17,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 166.h,
            color: ColorsManager.white,
            child: Text(
              "News App",
              style: GoogleFonts.inter(
                fontSize: 21.sp,
                color: ColorsManager.black17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    /// return to categories
                  homeProvider.changeHomeViewToCategories(context);
                  Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.home_filled, color: ColorsManager.white),
                      SizedBox(width: 8.w),
                      Text(
                        AppLocalizations.of(context)!.go_to_home,
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          color: ColorsManager.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Divider(color: ColorsManager.white),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     AppLocalizations.of(context)!.dark,
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        color: ColorsManager.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: configProvider.isDark,
                      onChanged: (value) {
                        configProvider.changeAppTheme(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    )


                  ],
                ),
                SizedBox(height: 24.h),
                Divider(color: ColorsManager.white),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     "English",
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        color: ColorsManager.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: configProvider.isEnglish,
                      onChanged: (value) {
                        configProvider.changeAppLang(value ? "en" : "ar");
                      },
                    )


                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
