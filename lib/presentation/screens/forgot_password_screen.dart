import 'package:exams_system/core/utils/app_assets.dart';
import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/app_strings.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:exams_system/data/services/auth.dart';
import 'package:exams_system/presentation/components/forgot_password/forgot_paragraph.dart';
import 'package:exams_system/presentation/components/generic/my_button.dart';
import 'package:exams_system/presentation/components/generic/my_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String email;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(AppStrings.forgotPassword),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(AppSize.s15.r),
            child: Column(
              children: [
                const ForgotParagraph(),
                SizedBox(height: AppSize.s40.h),
                SvgPicture.asset(
                  height: AppSize.s200.h,
                  width: AppSize.s200.w,
                  AppImages.forgotPassword,
                  color: AppColors.myYellow,
                ),
                SizedBox(height: AppSize.s40.h),
                MyFormField(
                  hint: AppStrings.enterEmail,
                  radius: AppSize.s24,
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  validation: AppStrings.noEmail,
                  onChanged: (value) => email = value,
                  borderColor: Theme.of(context).primaryColor,
                  fillColor: AppColors.white,
                  isFilled: true,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: AppSize.s15.h),
                MyButton(
                    text: AppStrings.send,
                    minWidth: double.infinity,
                    onclick: () async {
                      if (_formKey.currentState!.validate()) {
                        await auth.forgotPassword(email);
                      }
                    },
                    borderRadius: AppSize.s24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
