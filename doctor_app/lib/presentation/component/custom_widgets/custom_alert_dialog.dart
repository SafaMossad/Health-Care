
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/services/extension/dimen.dart';
import '../../../presentation/component/constants/resources/color_manager.dart';
import '../../../presentation/component/custom_widgets/custom_text.dart';
import '../constants/resources/font_manager.dart';


class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final String? icon;
  final Widget? nav;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.icon,
    required this.nav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: SvgPicture.asset(
        icon!,
      ),
      content: customText(
          textAlign: TextAlign.center,
          text: title,
          color: ColorManager.primaryColor,
          fontSize: FontSize.s14),
      contentPadding: EdgeInsets.symmetric(vertical: 5.h),
      actions: [
     /*   CustomButton(
          onPressed: () {
            myNavigate(screen:  nav, context: context);
          },
          buttonText: "Back To Login",
          margin: EdgeInsets.all(2.h),
          //  height: 5.h,
        )*/
      ],
    );
  }
}
