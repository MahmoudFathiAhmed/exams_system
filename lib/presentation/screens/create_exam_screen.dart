import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/app_strings.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:exams_system/data/services/database.dart';
import 'package:exams_system/presentation/components/create_exam/create_exam_avatar.dart';
import 'package:exams_system/presentation/components/generic/my_button.dart';
import 'package:exams_system/presentation/components/generic/my_form_field.dart';
import 'package:exams_system/presentation/screens/create_questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_string/random_string.dart';

class CreateExam extends StatefulWidget {
  const CreateExam({super.key});

  @override
  State<CreateExam> createState() => _CreateExamState();
}

class _CreateExamState extends State<CreateExam> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late String examTitle, examDiscreption;
  DataBaseServices db = DataBaseServices();

  void createExam() async {
    if (_formkey.currentState!.validate()) {
      String examId = randomAlphaNumeric(AppCount.c16);
      Map<String, String> examData = {
        AppStrings.examId: examId,
        AppStrings.examTitle: examTitle,
        AppStrings.examDiscreption: examDiscreption
      };
      await db.addExamData(examData, examId).then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CreateQuestionsScreen(
                examId: examId,
              ),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(AppStrings.createExam),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              const CreateExamAvatar(),
              SizedBox(height: AppSize.s10.h),
              MyFormField(
                hint: AppStrings.enterExamTitle,
                radius: AppSize.s24,
                type: TextInputType.text,
                controller: titleController,
                validation: AppStrings.noExamTitle,
                onChanged: (value) => examTitle = value,
                borderColor: Theme.of(context).primaryColor,
                fillColor: AppColors.white,
                isFilled: true,
                prefixIcon: Icon(
                  Icons.title,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: AppSize.s15.h),
              MyFormField(
                hint: AppStrings.enterExamDesc,
                radius: 24,
                type: TextInputType.text,
                controller: descriptionController,
                validation: AppStrings.noExamDesc,
                onChanged: (value) => examDiscreption = value,
                borderColor: Theme.of(context).primaryColor,
                fillColor: AppColors.white,
                isFilled: true,
                prefixIcon: Icon(
                  Icons.description,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: AppSize.s15.h),
              MyButton(
                text: AppStrings.createExam,
                minWidth: double.infinity,
                onclick: createExam,
                borderRadius: AppSize.s24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
