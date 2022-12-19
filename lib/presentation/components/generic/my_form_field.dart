import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFormField extends StatelessWidget {
  // final String label;
  final String hint;
  // final String? Function(String?)? validation;
  final String validation;
  final double radius;
  final Color borderColor;
  final Color fillColor;
  final double contentPadding;
  final TextInputType type;
  final bool isPassword;
  final bool isFilled;
  final TextEditingController controller;
  final Widget prefixIcon;
  final Widget suffixIcon;
  // final FloatingLabelBehavior floatingLabelBehavior;
  final Function(String) onChanged;

  const MyFormField({
    Key? key,
    // required this.label,
    required this.hint,
    required this.radius,
    required this.type,
    required this.controller,
    required this.validation,
    this.isPassword = false,
    this.prefixIcon = const SizedBox(height: AppSize.s0, width: AppSize.s0),
    this.suffixIcon = const SizedBox(height: AppSize.s0, width: AppSize.s0),
    required this.onChanged,
    required this.borderColor,
    this.contentPadding = AppSize.s0,
    // this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    required this.fillColor,
    required this.isFilled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleSmall,
      controller: controller,
      keyboardType: type,
      maxLines: AppCount.c1,
      cursorColor: Theme.of(context).primaryColor,
      onChanged: onChanged,
      obscureText: isPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return validation;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: isFilled,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // labelText: label,
        hintText: hint,
        iconColor: Theme.of(context).primaryColor,
        prefixIconColor: Theme.of(context).primaryColor,
        suffixIconColor: Theme.of(context).primaryColor,
        hintStyle: Theme.of(context).textTheme.titleSmall,
        labelStyle: Theme.of(context).textTheme.titleSmall,
        contentPadding: EdgeInsets.symmetric(horizontal: contentPadding.h),
        // floatingLabelBehavior: floatingLabelBehavior,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: BorderSide(color: borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}
