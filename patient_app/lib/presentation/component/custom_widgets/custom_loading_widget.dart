
import 'package:flutter/material.dart';

import '../constants/resources/indicator.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyProgressIndicator(),
    );
  }
}