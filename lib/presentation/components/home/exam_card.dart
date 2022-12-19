import 'package:exams_system/core/routes/route_names.dart';
import 'package:exams_system/core/routes/routes_arguments.dart';
import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:exams_system/presentation/components/generic/gradient_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamCard extends StatelessWidget {
  final String title;
  final String description;
  final String examId;
  const ExamCard(
      {super.key,
      required this.title,
      required this.description,
      required this.examId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.setExamRoute, arguments: SetExamArgs(examId));
      },
      child: SizedBox(
        height: AppSize.s150.h,
        child: Stack(
          children: [
            GradientCardWidget(
                startColor: AppColors.myteal,
                endColor: AppColors.myteal.withOpacity(AppSize.s0_1)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: AppSize.s6.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s20.h),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
