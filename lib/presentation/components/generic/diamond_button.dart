import 'package:exams_system/core/utils/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class DiamondButton extends StatelessWidget {
  final String svgIcon;
  final Color backgroundColor;
  final Color iconColor;
  final double sideLength;
  final double iconSize;
  final VoidCallback onTap;
  final double angle;
  final double radius;
  final double padding;

  const DiamondButton({
    Key? key,
    required this.svgIcon,
    required this.onTap,
    required this.backgroundColor,
    required this.iconColor,
    this.padding = AppSize.s12,
    this.sideLength = AppSize.s55,
    this.iconSize = AppSize.s18,
    this.radius = AppSize.s14,
    this.angle = math.pi / AppSize.s4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.rotate(
        angle: -angle,
        child: Container(
          height: sideLength.h,
          width: sideLength.w,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(radius.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(padding.r),
            child: Transform.rotate(
              angle: angle,
              child: SvgPicture.asset(
                svgIcon,
                height: iconSize.h,
                width: iconSize.w,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
