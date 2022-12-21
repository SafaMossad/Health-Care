import 'package:flutter/material.dart';
import 'package:patient_app/core/services/extension/dimen.dart';
import 'package:patient_app/presentation/component/custom_widgets/tap_effect.dart';
import '../components.dart';
import '../constants/constant.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Icon? icon;
  final double paddingV = 6;
  final double paddingH = 6;
  final double marginV = 6;
  final double marginH = 6;
  final bool withBorder;

  final bool loading;
  final TextStyle? textStyle;

  final bool fullWidth = false;
  final bool shadow = false;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final BorderRadius? radius;

  final VoidCallback? onPressed;

  const CustomButton(
      {Key? key,
        this.buttonText,
        this.width,
        this.withBorder = false,
        this.height,
        this.radius,
        this.textStyle,
        this.borderColor,
        this.padding,
        this.margin,
        this.loading = false,
        this.backgroundColor,
        this.icon,
        this.textColor,
        this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      /* padding: padding ?? const EdgeInsets.only(),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 8,),*/
      child: TapEffect(
        isClickable: !loading,
        onClick: loading ? null : onPressed,
        child: Container(
          height: height ?? 50.h,
          width: width,
          // padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
          decoration: BoxDecoration(
            border: withBorder
                ? Border.all(
                color: borderColor ??
                    backgroundColor ??
                    Theme.of(context).primaryColor)
                : null,
            boxShadow: const [
              BoxShadow(
                  color: ColorManager.grey,
                  spreadRadius: 1,
                  blurRadius: 5), // changes position of shadow
            ],
            color: backgroundColor ?? ColorManager.primaryColor,
            // gradient: backgroundColor == null ? getMainColorGradient() : null,
            borderRadius: radius ??
                BorderRadius.all(
                  Radius.circular(5.r),
                ),
          ),
          child: Center(
              child: loading
                  ? const CircularProgressIndicator(color: Colors.white,)
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? Icon(
                    Icons.shopping_cart,
                    color: ColorManager.white,
                    size: 20.h,
                  )
                      : const SizedBox(),
                  SizedBox(width: 10.w,),
                  CustomText(
                    textStyle: textStyle != null
                        ? textStyle!.copyWith(
                      color: textColor ?? Colors.white,
                      fontSize: FontSize.s16.sp,
                      fontWeight: FontWeightManager.medium,
                    )
                        : Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(
                      color: textColor ?? Colors.white,
                      fontSize: FontSize.s16.sp,
                      fontWeight: FontWeightManager.medium,
                    ),
                    text: buttonText ?? "",
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
