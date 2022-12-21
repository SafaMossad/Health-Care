import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../component/constants/constant.dart';


ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primaryColor,
    fontFamily: FontConstants.fontFamily,
    canvasColor: ColorManager.white,
    //splashColor: ColorManager.w,
    // ripple effect color
    // card view theme
    cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.lightBlack,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.primaryColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(color: ColorManager.lightBlack,),

        centerTitle: true,
        color: ColorManager.primaryColor,
        elevation: 0,
        shadowColor: ColorManager.lightBlack,
        titleTextStyle: getBoldStyle(
          fontSize: FontSize.s22,
          color: ColorManager.primaryColor,
        )),
    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        // disabledColor: ColorManager.lightBlack1,
        buttonColor: ColorManager.primaryColor,
        splashColor: ColorManager.lightBlack),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            primary: ColorManager.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    textTheme: TextTheme(
      //As the largest text on the screen, display styles are reserved for short,
      // important text or numerals. They work best on large screens.
      displayLarge: getLightStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s22,
      ),
      //Extremely large text.
      headlineLarge: getSemiBoldStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s20,
      ),
      headlineMedium: getSemiBoldStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s18,
      ),
      //text
      //Titles are smaller than headline styles and should be used for shorter, medium-emphasis text.
      titleLarge: getSemiBoldStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s18,
      ),
      titleMedium: getMediumStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s16,
      ),
      titleSmall: getMediumStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s14,
      ),
      //label
      //Used for text on ElevatedButton, TextButton and OutlinedButton.
      //Label styles are smaller, utilitarian styles, used for areas of the UI such as text inside of components
      // or very small supporting text in the content body, like captions.
      labelLarge: getMediumStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s14,
      ),
      labelMedium: getMediumStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s12,
      ),
      labelSmall: getMediumStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s11,
      ),
      //body
      // Body styles are used for longer passages of text.
      bodyLarge: getRegularStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s16,
      ),
      bodyMedium: getRegularStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s14,
      ),
      bodySmall: getRegularStyle(
        color: ColorManager.lightBlack,
      ),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        iconColor: ColorManager.lightBlack,
        // content padding
        // hint style
        hintStyle: getRegularStyle(
            color: ColorManager.lightBlack, fontSize: FontSize.s17),
        labelStyle: getMediumStyle(
            color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: Colors.red),

        // enabled border style
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),

        // focused border style
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.lightBlack, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.primaryColor, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
