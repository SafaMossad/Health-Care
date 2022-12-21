import 'package:flutter/material.dart';
import 'package:patient_app/core/services/extension/dimen.dart';

import '../components.dart';
import '../constants/constant.dart';

class CustomEmptyList extends StatelessWidget {
  const CustomEmptyList({
    required this.message,
    Key? key,
  }) : super(key: key);
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomAssetsImage(
            image: AssetsManager.noDataImg,
            //color: ColorManager.primaryColor,
            height: 100,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomText(
              text: message,
              textStyle: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            height: 50.h,
          ),

        ],
      ),
    );
  }
}
