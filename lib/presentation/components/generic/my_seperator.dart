import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySeperator extends StatelessWidget {
  const MySeperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.s8.w),
      child: Container(
        height: AppSize.s1_5,
        margin: EdgeInsets.symmetric(vertical: AppSize.s10.h),
        decoration: BoxDecoration(
          color: AppColors.myYellow,
        ),
      ),
    );
  }
}
