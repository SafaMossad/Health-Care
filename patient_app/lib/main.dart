import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/config/navigation/navigation.dart';
import 'package:patient_app/core/network/network_connectivity_checker.dart';
import 'package:patient_app/di_container.dart';
import 'package:patient_app/presentation/component/constants/resources/strings_manager.dart';
import 'package:patient_app/presentation/themes/theme_manager.dart';
import 'package:patient_app/providers.dart';
import 'package:patient_app/translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await init();
  runApp(AppProviders(
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  ));;
}

BuildContext? appContext;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appContext = context;

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: StringsManager.appName,
      theme: getApplicationTheme(),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: RouteGenerator.onGenerateRoute,

      builder: (context, child) {
        return Builder(
          builder: (context) {
            return networkConnectivityChecker(
              child: child!,
            );
          },
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
