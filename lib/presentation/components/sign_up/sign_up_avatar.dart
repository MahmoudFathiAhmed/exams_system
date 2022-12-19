import 'package:exams_system/core/utils/app_assets.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpAvatar extends StatelessWidget {
  const SignUpAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s250.h,
      width: AppSize.s250.w,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(image: AssetImage(AppImages.bg2))),
    );
  }
}
