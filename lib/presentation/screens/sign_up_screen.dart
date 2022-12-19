import 'package:exams_system/core/routes/route_names.dart';
import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/app_strings.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:exams_system/data/services/auth.dart';
import 'package:exams_system/presentation/components/generic/my_button.dart';
import 'package:exams_system/presentation/components/generic/my_form_field.dart';
import 'package:exams_system/presentation/components/generic/text_button.dart';
import 'package:exams_system/presentation/components/sign_up/sign_up_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  late String email, password, name;
  Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();

  onSave() async {
    if (_formKey.currentState!.validate()) {
      await auth.signUpEmailAndPassowrd(email, password).then((value) {
        if (value != null) {
          Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.signUp),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSize.s15.r),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SignUpAvatar(),
                  SizedBox(height: AppSize.s50.h),
                  MyFormField(
                    hint: AppStrings.enterName,
                    radius: 24,
                    type: TextInputType.text,
                    controller: nameController,
                    validation: AppStrings.noName,
                    onChanged: (value) => name = value,
                    borderColor: Theme.of(context).primaryColor,
                    fillColor: AppColors.white,
                    isFilled: true,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: AppSize.s20.h),
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
                  SizedBox(height: AppSize.s20.h),
                  MyFormField(
                    hint: AppStrings.enterPassword,
                    radius: AppSize.s24,
                    type: TextInputType.visiblePassword,
                    controller: passwordController,
                    validation: AppStrings.noPassword,
                    onChanged: (value) => password = value,
                    borderColor: Theme.of(context).primaryColor,
                    fillColor: AppColors.white,
                    isFilled: true,
                    isPassword: true,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: AppSize.s20.h),
                  MyButton(
                      text: AppStrings.signUp,
                      minWidth: double.infinity,
                      onclick: onSave,
                      borderRadius: AppSize.s24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.haveAccount,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      MyTextButton(
                          onClick: () {
                            Navigator.of(context).pushNamed(Routes.signInRoute);
                          },
                          text: AppStrings.signIn)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
