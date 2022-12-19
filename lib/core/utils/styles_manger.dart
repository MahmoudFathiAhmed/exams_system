import 'package:exams_system/core/utils/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:exams_system/core/utils/font_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color, {
  double letterSpacing = AppSize.s0,
}) {
  return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: AppFonts.defaultFontFamily,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing);
}

//AppBarTitleSyle
_getAppBarStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color, {
  double letterSpacing = AppSize.s0,
}) {
  return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: AppFonts.nasalization,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing);
}

TextStyle getRegularAppBarTitleStyle({
  double fontSize = FontSize.s18,
  double letterSpacing = AppSize.s0,
  required Color color,
}) {
  return _getAppBarStyle(fontSize, FontWeightManager.regular, color,
      letterSpacing: letterSpacing);
}

//Ultra light style
TextStyle getUltralightStyle({
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.ultralight, color,
      letterSpacing: letterSpacing);
}

//Thin style
TextStyle getThinStyle({
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.thin, color,
      letterSpacing: letterSpacing);
}

//Light style
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color,
      letterSpacing: letterSpacing);
}

//Regular style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,
      letterSpacing: letterSpacing);
}

//Medium style
TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,
      letterSpacing: letterSpacing);
}

//SemiBold style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
      letterSpacing: letterSpacing);
}

//Bold style
TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color,
      letterSpacing: letterSpacing);
}

//Heavy style
TextStyle getHeavyStyle({
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.heavy, color,
      letterSpacing: letterSpacing);
}

//Black style
TextStyle getBlackStyle({
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s0,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.black, color,
      letterSpacing: letterSpacing);
}