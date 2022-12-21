import 'package:doctor_app/core/services/extension/dimen.dart';
import 'package:flutter/material.dart';


import '../components.dart';
import '../constants/constant.dart';

class CustomErrorResponseWidget extends StatelessWidget {
  const CustomErrorResponseWidget({
    Key? key,
    this.message,
  }) : super(key: key);
final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomAssetsImage(
            image: AssetsManager.errorResponse,
            //color: ColorManager.primaryColor,
            height: 100,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomText(
              text: message ?? "Some Thing Went Wrong",
              textStyle: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            height: 50.h,
          ),
 /*         Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: CustomButton(onPressed: (){
              myNavigate(routeName: Routes.login, context: context);
            }, buttonText: "Sorry You Must Login First"),
          )*/
        ],
      ),
    );
  }
}
