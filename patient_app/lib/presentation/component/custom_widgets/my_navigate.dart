import 'package:flutter/cupertino.dart';

Future? myNavigate(
    {@required String? routeName,
    bool withBackButton = true,
    @required BuildContext? context}) {
  if (withBackButton == true) {
    Navigator.pushNamed(context!, routeName!);
  } else {
    Navigator.pushReplacementNamed(
      context!,
      routeName!,
    );
  }
  return null;
}
