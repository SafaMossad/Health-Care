import 'package:flutter/material.dart';
import 'package:patient_app/core/services/extension/dimen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'color_manager.dart';

class MyProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? size;

  const MyProgressIndicator({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      color: color ?? ColorManager.primaryColor,
      size: size ?? 80.h,
    );
  }
}
