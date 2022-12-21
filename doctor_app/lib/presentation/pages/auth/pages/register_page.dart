import 'package:doctor_app/core/services/extension/dimen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../../data/models/base/response_model.dart';
import '../../../../../translations/local_keys.g.dart';
import '../../../../config/navigation/navigation.dart';
import '../../../component/components.dart';
import '../../../component/constants/constant.dart';
import '../../../component/custom_widgets/custom_snack_bar.dart';
import '../view_model/auth_register_view_model.dart';

class GenderModel {
  int? id;
  String? name;

  GenderModel(this.id, this.name);
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  String? _selectedGenderId;

  List<GenderModel>? genderList = [
    GenderModel(1, "Male"),
    GenderModel(2, "Female"),
  ];

  Future<void> _submit(context, RegisterViewModel viewModel) async {
    if (!_key.currentState!.validate()) {
      debugPrint("Form Not Valid");
      return;
    } else {
      _key.currentState!.save();
      ResponseModel responseModel = await viewModel.register(
        context: context,
        fName: _firstNameController.text,
        lName: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        age: int.parse(_ageController.text),
        phone: _phoneController.text,
        gender: int.parse(_selectedGenderId!),
        address: _addressController.text,
        specialist: _specialistController.text,
        specialistDescription: _specialistDescriptionController.text,
        country: _countryController.text,
        price: _priceController.text,
        availableFrom: _availableFromController.text,
        availableTo: _availableToController.text,
      );
      if (responseModel.isSuccess) {
        print("Registered in successfully");
        NavigationService.pushReplacement(context, Routes.reservationsPage);
      }
    }
  }

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _specialistController = TextEditingController();
  final TextEditingController _specialistDescriptionController =
      TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _availableFromController =
      TextEditingController();
  final TextEditingController _availableToController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundGreyColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    //  color: Colors.yellow,
                    height: 150.h,
                    width: 200.w,
                    child: Image.asset(
                      AssetsManager.appLogo,
                      fit: BoxFit.contain,
                    ),
                  ),

                  //email
                  CustomTextField(
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.email,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: translate(LocaleKeys.email),
                    // maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                          controller: _firstNameController,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return translate(LocaleKeys.required);
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.person,
                            size: 25.h,
                            color: ColorManager.iconColor,
                          ),
                          hintText: translate(LocaleKeys.firstName),
                          maxLine: 1,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                          controller: _lastNameController,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return translate(LocaleKeys.required);
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.person,
                            size: 25.h,
                            color: ColorManager.iconColor,
                          ),
                          hintText: translate(LocaleKeys.secondName),
                          maxLine: 1,
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  Container(
                    height: 60.h,
                    padding: EdgeInsets.symmetric(horizontal: 13.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: ColorManager.grey,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.person,
                            size: 20.w, color: ColorManager.hintColor),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: DropdownButton(
                            value: _selectedGenderId,
                            isExpanded: true,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: ColorManager.lightBlack,
                            ),
                            iconSize: 25,
                            hint: CustomText(
                              text: translate(LocaleKeys.gender),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: ColorManager.hintColor),
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedGenderId = newValue.toString();
                                debugPrint("_selected Group Id $newValue");
                              });
                            },
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            items: genderList?.map<DropdownMenuItem<String>>(
                                (GenderModel value) {
                              return DropdownMenuItem<String>(
                                //for make on change Return id
                                value: value.id.toString(),
                                child: CustomText(
                                  text: value.name ?? "",
                                  textStyle: textFieldTextStyle(),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  //Mobile Number
                  CustomTextField(
                    controller: _phoneController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.phone_android,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: translate(LocaleKeys.phone),
                    textInputType: TextInputType.phone,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //Age
                  CustomTextField(
                    controller: _ageController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: "Age",
                    textInputType: TextInputType.number,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //Specialist
                  CustomTextField(
                    controller: _specialistController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.phone_android,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: "Specialist",
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //specialistDescription
                  CustomTextField(
                    controller: _specialistDescriptionController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.phone_android,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: "Specialist Description",
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //countryDescription
                  CustomTextField(
                    controller: _countryController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.phone_android,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: "Country",
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //address
                  CustomTextField(
                    controller: _addressController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.phone_android,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: "Address",
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //available From
                  CustomTextField(
                    controller: _availableFromController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.phone_android,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: "Available From",
                    textInputType: TextInputType.number,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //available To
                  CustomTextField(
                    controller: _availableToController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.phone_android,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: "Available To",
                    textInputType: TextInputType.number,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //price
                  CustomTextField(
                    controller: _priceController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.phone_android,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: "Price",
                    textInputType: TextInputType.number,
                    maxLine: 1,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //Password
                  CustomTextField(
                    controller: _passwordController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      } else if (value.length < 7) {
                        return "Password Should be 8 char or more";
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 25.h,
                      color: ColorManager.iconColor,
                    ),
                    hintText: translate(LocaleKeys.password),
                    maxLine: 1,
                    isPassword: true,
                    fillColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //ConfirmPassword
                  CustomTextField(
                    controller: _confirmPasswordController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return translate(LocaleKeys.required);
                      } else if (_passwordController.text != value) {
                        return translate(LocaleKeys.invalidConfirmPasswordHint);
                      }
                      return null;
                    },
                    prefixIcon: Icon(Icons.lock,
                        size: AppSize.s20.h, color: ColorManager.iconColor),
                    hintText: translate(LocaleKeys.confirmPassword),
                    maxLine: 1,
                    isPassword: true,
                    fillColor: Colors.white,
                  ),

                  SizedBox(
                    height: 45.h,
                  ),
                  Consumer<RegisterViewModel>(
                    builder: (context, viewModel, child) => CustomButton(
                      loading: viewModel.isLoading,
                      onPressed: () async {
                        _submit(context, viewModel);
                      },
                      buttonText: translate(LocaleKeys.newAccount),
                    ),
                  ),

                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: translate(LocaleKeys.alreadyHaveAccount),
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.hintColor),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CustomText(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: ColorManager.blueColor,
                                      fontWeight: FontWeightManager.semiBold),
                              text: translate(LocaleKeys.login)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
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
