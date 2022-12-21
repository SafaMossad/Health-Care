import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/config/navigation/navigation.dart';
import 'package:patient_app/core/services/extension/dimen.dart';
import 'package:patient_app/presentation/component/components.dart';
import 'package:patient_app/presentation/component/constants/constant.dart';
import 'package:provider/provider.dart';

import '../../../../domain/domain.dart';
import '../../../../translations/local_keys.g.dart';
import '../../../component/custom_widgets/custom_loading_widget.dart';
import '../home.dart';
import '../view_model/profile_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: CustomText(
              text: "My Profile",
              textStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: ColorManager.white)),
          centerTitle: true,

          automaticallyImplyLeading: false),
      body: FutureBuilder(
          future: viewModel.getHomeDoctors(context: context),
          builder: (ctx, data) {
            if (data.connectionState == ConnectionState.waiting ||
                data.hasError) {
              return const Center(
                child: CustomLoadingWidget(),
              );
            } else {
              return Consumer<ProfileViewModel>(
                builder: (_, listData, ch) {
                  if (listData.doctorsList == null) {
                    return const Center(
                        child: CustomText(text: "Some Thing went Wrong"));
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 130.h,
                            width: 90.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const CustomAssetsImage(
                                image: AssetsManager.appLogo),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.person_pin_rounded,
                                  size: 30.w, color: ColorManager.greenColor),
                              title: CustomText(
                                  text: listData.doctorsList?.userName ?? ""),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.email,
                                  size: 30.w, color: ColorManager.greenColor),
                              title: CustomText(
                                  text: listData.doctorsList?.email ?? ""),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.person_pin_rounded,
                                  size: 30.w, color: ColorManager.greenColor),
                              title: CustomText(
                                  text: listData.doctorsList?.phone ?? ""),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.date_range_outlined,
                                  size: 30.w, color: ColorManager.greenColor),
                              title: CustomText(
                                  text:"${ listData.doctorsList?.age.toString()} Age" ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomButton(
                            onPressed: () {
                              Provider.of<LocalAuthProvider>(context,
                                      listen: false)
                                  .logOut()
                                  .then((value) {
                                if (value == true) {
                                  NavigationService.pushReplacement(
                                      context, Routes.loginScreen);
                                }
                              });
                            },
                            buttonText: translate(LocaleKeys.logout),
                          )
                        ],
                      ),
                    );
                  }
                },
              );
            }
          }),
    );
  }
}
