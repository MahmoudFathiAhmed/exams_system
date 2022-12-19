import 'package:exams_system/core/utils/values_manger.dart';
import 'package:flutter/material.dart';
class MyTextButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;


  const MyTextButton({Key? key,
    required this.onClick,
    required this.text,

  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        text,
        maxLines: AppCount.c1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}