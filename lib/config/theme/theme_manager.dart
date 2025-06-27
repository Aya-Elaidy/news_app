import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';
class ThemeManager {
  static final ThemeData light = ThemeData();
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
