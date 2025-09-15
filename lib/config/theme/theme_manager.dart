import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  Color? textColor;
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.whiteBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.whiteBlue,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: ColorsManager.blue,
      ),
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      prefixIconColor: ColorsManager.grey,
      suffixIconColor: ColorsManager.grey,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r),
        ),
        textStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      ),
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black1c,
      ),

    ),
  );
  static final ThemeData dark = ThemeData();
}
