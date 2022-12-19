import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Answer extends StatefulWidget {
  final String answer;
  final String answerDescription, answerSelected, correctAnswer;
  const Answer(
      {super.key,
      required this.answer,
      required this.answerDescription,
      required this.answerSelected,
      required this.correctAnswer});

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppSize.s40,
          height: AppSize.s40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s30.r),
            color: widget.answerDescription == widget.answerSelected
                ? widget.answerSelected == widget.correctAnswer
                    ? AppColors.green
                    : AppColors.red
                : AppColors.myteal,
          ),
          child: Text(widget.answer,
              style: Theme.of(context).textTheme.displayMedium),
        ),
        SizedBox(width: 8.w),
        Text(widget.answerDescription,
            style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}
