import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';
class ThemeManager {
  static final ThemeData light = ThemeData(


    appBarTheme: AppBarTheme(

      iconTheme: IconThemeData(color: ColorsManager.black17),
      backgroundColor: ColorsManager.white,
      foregroundColor: ColorsManager.black17,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20.sp,
        color: ColorsManager.black17,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: ColorsManager.white,
    tabBarTheme: TabBarTheme(
      tabAlignment: TabAlignment.start,
      indicatorColor: ColorsManager.black17,
      dividerColor: Colors.transparent,
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.black17,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14.sp,
        color: ColorsManager.black17,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 24.sp,
        color: ColorsManager.black17,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.black17,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 12.sp,
        color: ColorsManager.grey,
        fontWeight: FontWeight.w500,
      ),

    ),
  );
  static final ThemeData dark = ThemeData(

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorsManager.white),
      backgroundColor: ColorsManager.black17,
      foregroundColor: ColorsManager.white,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: ColorsManager.black17,
    tabBarTheme: TabBarTheme(
      tabAlignment: TabAlignment.start,
      indicatorColor: ColorsManager.white,
      dividerColor: Colors.transparent,
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 24.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 12.sp,
        color: ColorsManager.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
