import 'package:exams_system/core/prefs/app_prefs.dart';
import 'package:exams_system/core/routes/route_names.dart';
import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/app_strings.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:exams_system/data/services/auth.dart';
import 'package:exams_system/presentation/components/generic/my_button.dart';
import 'package:exams_system/presentation/components/generic/my_form_field.dart';
import 'package:exams_system/presentation/components/generic/text_button.dart';
import 'package:exams_system/presentation/components/sign_in/sign_in_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  bool _isloading = false;
  Auth auth = Auth();

  onsave() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      await auth.sigInEmailAndPassword(email, password).then((value) {
        setState(() {
          _isloading = false;
        });
        if (value != null) {
          AppPrefs.saveUserLoginDetails(true);
          Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(AppSize.s15.r),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SignInAvatar(),
                        SizedBox(height: AppSize.s50.h),
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
                            text: AppStrings.signIn,
                            minWidth: double.infinity,
                            onclick: onsave,
                            borderRadius: AppSize.s24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyTextButton(
                              onClick: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.forgotPasswordRoute);
                              },
                              text: AppStrings.forgotPassword,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.noAccount,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            MyTextButton(
                                onClick: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.signUpRoute);
                                },
                                text: AppStrings.signUp)
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
