import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/font_manager.dart';
import 'package:exams_system/core/utils/styles_manger.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getDarkThemeData() => ThemeData(
      primaryColor: AppColors.myteal,
      scaffoldBackgroundColor: AppColors.pet2,
      backgroundColor: AppColors.pet2,
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.black.withOpacity(AppSize.s0_8),
        width: AppSize.s304.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s15.r),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: AppColors.pet2,
        style: ListTileStyle.drawer,
        horizontalTitleGap: AppSize.s0,
        textColor: AppColors.white,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.pet2,
        iconTheme: IconThemeData(color: AppColors.myYellow),
        titleTextStyle: getRegularAppBarTitleStyle(color: AppColors.white),
        elevation: AppSize.s0,
      ),
      iconTheme: IconThemeData(color: AppColors.myteal, size: AppSize.s24.r),
      textTheme: TextTheme(
        displayLarge: getRegularStyle(
            color: AppColors.white,
            fontSize: FontSize.s22,
            letterSpacing: AppSize.s1),
        displayMedium:
            getRegularStyle(color: AppColors.white, fontSize: FontSize.s20),
        displaySmall:
            getRegularStyle(color: AppColors.pet2, fontSize: FontSize.s18),
        headlineMedium:
            getRegularStyle(color: AppColors.pet2, fontSize: FontSize.s17),
        headlineSmall:
            getRegularStyle(color: AppColors.white, fontSize: FontSize.s16),
        titleLarge:
            getRegularStyle(color: AppColors.white, fontSize: FontSize.s18),
        titleMedium:
            getRegularStyle(color: AppColors.white, fontSize: FontSize.s16),
        titleSmall: getRegularStyle(
            color: AppColors.pet2, letterSpacing: 1, fontSize: FontSize.s18),
        bodyLarge:
            getRegularStyle(color: AppColors.myYellow, fontSize: FontSize.s18),
        bodyMedium:
            getRegularStyle(color: AppColors.white, fontSize: FontSize.s14),
      ),
    );
