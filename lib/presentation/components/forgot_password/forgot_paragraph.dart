import 'package:exams_system/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ForgotParagraph extends StatelessWidget {
  const ForgotParagraph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.forgotParagraph,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
