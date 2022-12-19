import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:exams_system/core/utils/app_strings.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:exams_system/data/models/question.dart';
import 'package:exams_system/presentation/components/set_exam.dart/answers_widget.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;
  final int total;
  const QuestionWidget({
    Key? key,
    required this.question,
    required this.total,
  }) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int total = AppCount.c0;
  int correct = AppCount.c0;
  int incorrect = AppCount.c0;
  int notAttempted = AppCount.c0;
  String answerSelected = AppStrings.emptyString;

  @override
  void initState() {
    total = widget.total;
    notAttempted = widget.total;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question.question,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: AppSize.s12.h,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.question.answered) {
                if (widget.question.answer1 == widget.question.correctAnswer) {
                  setState(() {
                    answerSelected = widget.question.answer1;
                    correct += AppCount.c1;
                    notAttempted -= AppCount.c1;
                    widget.question.answered = true;
                  });
                } else {
                  setState(() {
                    answerSelected = widget.question.answer1;
                    incorrect += AppCount.c1;
                    notAttempted -= AppCount.c1;
                    widget.question.answered = true;
                  });
                }
              }
            },
            child: Answer(
                answer: AppStrings.a,
                answerDescription: widget.question.answer1,
                correctAnswer: widget.question.correctAnswer,
                answerSelected: answerSelected),
          ),
          SizedBox(
            height: AppSize.s12.h,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.question.answered) {
                if (widget.question.answer2 == widget.question.correctAnswer) {
                  setState(() {
                    answerSelected = widget.question.answer2;
                    correct += AppCount.c1;
                    notAttempted -= AppCount.c1;
                    widget.question.answered = true;
                  });
                } else {
                  setState(() {
                    answerSelected = widget.question.answer2;
                    incorrect += AppCount.c1;
                    notAttempted -= AppCount.c1;
                    widget.question.answered = true;
                  });
                }
              }
            },
            child: Answer(
                answer: AppStrings.b,
                answerDescription: widget.question.answer2,
                correctAnswer: widget.question.correctAnswer,
                answerSelected: answerSelected),
          ),
          SizedBox(
            height: AppSize.s12.h,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.question.answered) {
                if (widget.question.answer3 == widget.question.correctAnswer) {
                  setState(() {
                    answerSelected = widget.question.answer3;
                    correct += AppCount.c1;
                    notAttempted -= AppCount.c1;
                    widget.question.answered = true;
                  });
                } else {
                  setState(() {
                    answerSelected = widget.question.answer3;
                    incorrect += AppCount.c1;
                    notAttempted -= AppCount.c1;
                    widget.question.answered = true;
                  });
                }
              }
            },
            child: Answer(
                answer: AppStrings.c,
                answerDescription: widget.question.answer3,
                correctAnswer: widget.question.correctAnswer,
                answerSelected: answerSelected),
          ),
          SizedBox(
            height: AppSize.s12.h,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.question.answered) {
                if (widget.question.answer4 == widget.question.correctAnswer) {
                  setState(() {
                    answerSelected = widget.question.answer4;
                    correct += AppCount.c1;
                    notAttempted -= AppCount.c1;
                    widget.question.answered = true;
                  });
                } else {
                  setState(() {
                    answerSelected = widget.question.answer4;
                    incorrect += AppCount.c1;
                    notAttempted -= AppCount.c1;
                    widget.question.answered = true;
                  });
                }
              }
            },
            child: Answer(
                answer: AppStrings.d,
                answerDescription: widget.question.answer4,
                correctAnswer: widget.question.correctAnswer,
                answerSelected: answerSelected),
          ),
          SizedBox(
            height: AppSize.s12.h,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.question.answered) {
                if (widget.question.answer5 == widget.question.correctAnswer) {
                  setState(() {
                    answerSelected = widget.question.answer5;
                    correct += AppCount.c1;
                    notAttempted -= AppCount.c1;
                    widget.question.answered = true;
                  });
                } else {
                  setState(() {
                    answerSelected = widget.question.answer5;
                    incorrect += AppCount.c1;
                    notAttempted -= AppCount.c1;
                    widget.question.answered = true;
                  });
                }
              }
            },
            child: Answer(
                answer: AppStrings.e,
                answerDescription: widget.question.answer5,
                correctAnswer: widget.question.correctAnswer,
                answerSelected: answerSelected),
          ),
          SizedBox(
            height: AppSize.s8.h,
          ),
          Text(
            '${AppStrings.questionPoints} $correct',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
