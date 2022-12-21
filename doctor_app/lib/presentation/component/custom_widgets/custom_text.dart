import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


import '../../../core/services/extension/dimen.dart';
import '../constants/constant.dart';
String translate(String word) {
  return word.tr();
}

Widget customText(
    {Key? key,
    String? text,
    Color? color,
    double? fontSize,
    double? height,
    bool underline = false,
    double? letterSpacing,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    String? fontFamily = FontConstants.fontFamily,
    TextOverflow? overflow,
    int? maxLines}) {
  return Text(
    text!,
    textAlign: textAlign,
    style: TextStyle(
        decoration: underline ? TextDecoration.underline : null,
        letterSpacing: letterSpacing,
        height: height,
        color: color ?? ColorManager.lightBlack,
        fontSize: fontSize?.sp ?? 14.sp,
        fontWeight: fontWeight ?? FontWeightManager.medium,
        fontFamily: fontFamily),
    overflow: overflow,
    maxLines: maxLines,
  );
}

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      this.textStyle,
      required this.text,
      this.textAlign,
      this.overflow,
      this.maxLines})
      : super(key: key);
  final String? text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? textStyle;


  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: textStyle ?? Theme.of(context).textTheme.titleSmall,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
