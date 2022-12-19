// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui' as ui;

import 'package:exams_system/core/utils/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientCardWidget extends StatelessWidget {
  final double height;
  final Color startColor;
  final Color endColor;
  final double radius;
  const GradientCardWidget({
    Key? key,
    this.height = AppSize.s150,
    required this.startColor,
    required this.endColor,
    this.radius = AppSize.s24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p16.r),
        child: Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                gradient: LinearGradient(
                    colors: [startColor, endColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: endColor,
                    blurRadius: AppSize.s12,
                    offset: const Offset(AppSize.s0, AppSize.s6),
                  ),
                ],
              ),
            ),
            Positioned(
              right: AppSize.s0,
              bottom: AppSize.s0,
              top: AppSize.s0,
              child: CustomPaint(
                size: const Size(AppSize.s100, AppSize.s150),
                painter:
                    CustomCardShapePainter(AppSize.s24, startColor, endColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        const Offset(AppSize.s0, AppSize.s0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(AppSize.s0_8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(AppSize.s0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, AppSize.s0, size.width - radius, AppSize.s0)
      ..lineTo(size.width - AppSize.s1_5 * radius, AppSize.s0)
      ..quadraticBezierTo(-radius, AppCount.c2 * radius, AppSize.s0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}