import 'package:doctor_app/core/services/extension/dimen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../../config/navigation/navigation.dart';
import '../../../../data/models/base/response_model.dart';
import '../../../../translations/local_keys.g.dart';
import '../../../component/components.dart';
import '../../../component/constants/constant.dart';
import '../view_model/auth_login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Future<void> _submit(
      context, LoginViewModel viewModel) async {
    if (!_key.currentState!.validate()) {
      debugPrint("Form Not Valid");
      return;
    } else {
      _key.currentState!.save();
      ResponseModel responseModel = await viewModel.register(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (responseModel.isSuccess) {
        print("Registered in successfully");
        NavigationService.pushReplacement(context, Routes.reservationsPage);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  SizedBox(
                    //  color: Colors.yellow,
                    height: 250.h,
                    width: 200.w,
                    child: Image.asset(
                      AssetsManager.appLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //email
                  CustomTextField(
                    controller: _emailController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      } else if (!value.isValidEmail()) {
                        return translate(LocaleKeys.invalidEmailHint);
                      }
                      return null;
                    },
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 23.w, right: 13.w),
                      child: Icon(
                        Icons.email,
                        color: ColorManager.iconColor,
                        size: 25.w,
                      ),
                    ),
                    hintText: translate(LocaleKeys.email),
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  //Password
                  CustomTextField(
                    controller: _passwordController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 23.w, right: 13.w),
                      child: Icon(
                        Icons.lock,
                        color: ColorManager.iconColor,
                        size: 25.w,
                      ),
                    ),
                    hintText: translate(LocaleKeys.password),
                    maxLine: 1,
                    isPassword: true,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 41.h,
                  ),



                  Consumer<LoginViewModel>(
                    builder: (context, viewModel, child) => CustomButton(
                      loading: viewModel.isLoading,
                      onPressed: () async {
                        _submit(context, viewModel);
                      },
                      buttonText: translate(LocaleKeys.login),
                    ),
                  ),


                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorManager.hintColor,
                                fontWeight: FontWeightManager.medium),
                        text: translate(LocaleKeys.haveNotAccountQuestion),
                      ),
                      InkWell(
                        onTap: () {
                          NavigationService.push(context, Routes.signupScreen);
                        },
                        child: CustomText(
                            textStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: ColorManager.blueColor,
                                    fontWeight: FontWeightManager.semiBold),
                            text: translate(LocaleKeys.signUp)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
