// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/app_strings.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:exams_system/data/services/database.dart';
import 'package:exams_system/presentation/components/generic/my_button.dart';
import 'package:exams_system/presentation/components/generic/my_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateQuestionsScreen extends StatefulWidget {
  final String examId;
  const CreateQuestionsScreen({
    Key? key,
    required this.examId,
  }) : super(key: key);

  @override
  State<CreateQuestionsScreen> createState() => _CreateQuestionsScreenState();
}

class _CreateQuestionsScreenState extends State<CreateQuestionsScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController questionController = TextEditingController();
  TextEditingController correctAnswerController = TextEditingController();
  TextEditingController answer2Controller = TextEditingController();
  TextEditingController answer3Controller = TextEditingController();
  TextEditingController answer4Controller = TextEditingController();
  TextEditingController answer5Controller = TextEditingController();

  late String question, answer1, answer2, answer3, answer4, answer5;
  bool _isloading = false;

  DataBaseServices db = DataBaseServices();

  void createQuestion() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      Map<String, String> questionData = {
        AppStrings.question: question,
        AppStrings.answer1: answer1,
        AppStrings.answer2: answer2,
        AppStrings.answer3: answer3,
        AppStrings.answer4: answer4,
        AppStrings.answer5: answer5,
      };
      await db.addQuestionData(questionData, widget.examId).then((value) {
        setState(() {
          _isloading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(AppStrings.addQuestions),
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formkey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    MyFormField(
                      hint: AppStrings.enterAQuestion,
                      radius: AppSize.s24,
                      type: TextInputType.text,
                      controller: questionController,
                      validation: AppStrings.noQuestion,
                      onChanged: (value) => question = value,
                      borderColor: Theme.of(context).primaryColor,
                      fillColor: AppColors.white,
                      isFilled: true,
                      prefixIcon: Icon(
                        Icons.help_outline_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: AppSize.s10.h),
                    MyFormField(
                      hint: AppStrings.enterCorrectAnswer,
                      radius: AppSize.s24,
                      type: TextInputType.text,
                      controller: correctAnswerController,
                      validation: AppStrings.noCorrectAnswer,
                      onChanged: (value) => answer1 = value,
                      borderColor: Theme.of(context).primaryColor,
                      fillColor: AppColors.white,
                      isFilled: true,
                      prefixIcon: Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: AppSize.s10.h),
                    MyFormField(
                      hint: AppStrings.enterAnswer2,
                      radius: AppSize.s24,
                      type: TextInputType.text,
                      controller: answer2Controller,
                      validation: AppStrings.noAnswer2,
                      onChanged: (value) => answer2 = value,
                      borderColor: Theme.of(context).primaryColor,
                      fillColor: AppColors.white,
                      isFilled: true,
                      prefixIcon: Icon(
                        Icons.looks_two_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: AppSize.s10.h),
                    MyFormField(
                      hint: AppStrings.enterAnswer3,
                      radius: AppSize.s24,
                      type: TextInputType.text,
                      controller: answer3Controller,
                      validation: AppStrings.noAnswer3,
                      onChanged: (value) => answer3 = value,
                      borderColor: Theme.of(context).primaryColor,
                      fillColor: AppColors.white,
                      isFilled: true,
                      prefixIcon: Icon(
                        Icons.looks_3,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: AppSize.s10.h),
                    MyFormField(
                      hint: AppStrings.enterAnswer4,
                      radius: AppSize.s24,
                      type: TextInputType.text,
                      controller: answer4Controller,
                      validation: AppStrings.noAnswer4,
                      onChanged: (value) => answer4 = value,
                      borderColor: Theme.of(context).primaryColor,
                      fillColor: AppColors.white,
                      isFilled: true,
                      prefixIcon: Icon(
                        Icons.looks_4_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: AppSize.s10.h),
                    MyFormField(
                      hint: AppStrings.enterAnswer5,
                      radius: AppSize.s24,
                      type: TextInputType.text,
                      controller: answer5Controller,
                      validation: AppStrings.noAnswer5,
                      onChanged: (value) => answer5 = value,
                      borderColor: Theme.of(context).primaryColor,
                      fillColor: AppColors.white,
                      isFilled: true,
                      prefixIcon: Icon(
                        Icons.looks_5_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: AppSize.s30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                            text: AppStrings.submit,
                            minWidth: MediaQuery.of(context).size.width /
                                    AppCount.c2 -
                                AppCount.c40,
                            onclick: () {
                              Navigator.pop(context);
                            },
                            borderRadius: AppSize.s24),
                        MyButton(
                            text: AppStrings.addQuestion,
                            minWidth: MediaQuery.of(context).size.width /
                                    AppCount.c2 -
                                AppCount.c40,
                            onclick: createQuestion,
                            borderRadius: AppSize.s24),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
