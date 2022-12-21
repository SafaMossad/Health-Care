import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/navigation/navigation.dart';
import '../../../../core/constants/shared_preferences_keys.dart';
import '../../../../core/services/extension/dimen.dart';
import '../../../../domain/domain.dart';
import '../../../component/constants/constant.dart';

class SplashPage extends StatefulWidget {
  final int? duration;
  final Widget? goToPage;

  const SplashPage({Key? key, this.duration, this.goToPage}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    getLocalData();

    //getLocalData();
  }

  void getLocalData() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();



    String? token = sharedPreferences.getString(SharedPreferencesKeys.kToken);
    int? kUid = sharedPreferences.getInt(SharedPreferencesKeys.kUId);
    print("token $token");
    print("token $kUid");


    final storedData = Provider.of<LocalAuthProvider>(context, listen: false);
    bool? isLogin = await storedData.isLogin();

    if (isLogin) {

        Future.delayed(const Duration(seconds: 4), () async {
          NavigationService.pushReplacement(context, Routes.bottomNavigationPage);
        });

    } else {
      Future.delayed(const Duration(seconds: 4), () async {
        NavigationService.pushReplacement(context, Routes.loginScreen);

        // controller.dispose();
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(right: 50.w,left: 50.w,top: 50.w),
          child: Image.asset(
            AssetsManager.appLogo,

          ),
        ),
      ),
    );
  }
}
