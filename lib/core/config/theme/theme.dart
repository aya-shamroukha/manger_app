import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_font.dart';

ThemeData appTheme = ThemeData(
    //brightness: Brightness.dark,
    primaryColor: AppColor.primary,

//  appBarTheme:  AppBarTheme(
//   backgroundColor: AppColor.background,
//   centerTitle: false,

//  iconTheme: IconThemeData(color: AppColor.white),
//   titleTextStyle:
//   TextStyle(fontSize: 24,color: AppColor.textColor,fontWeight: FontWeight.normal),
// elevation: 0,

//   ),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //   shape: CircleBorder(),
    //   backgroundColor: AppColor.primary),
    scaffoldBackgroundColor: AppColor.background,
    drawerTheme: DrawerThemeData(backgroundColor: AppColor.background),
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: regularStyle(),
      displaySmall: normalStyle(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          textStyle: TextStyle(color: AppColor.primary, fontSize: 30.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      labelStyle: TextStyle(fontSize: 15.sp, color: AppColor.labelcolor),
      fillColor: AppColor.secondary,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.labelcolor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.labelcolor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.labelcolor)),
      hintStyle: TextStyle(fontSize: 15.sp, color: AppColor.labelcolor),
    ));
