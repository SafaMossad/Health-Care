import 'package:flutter/material.dart';

import '../constants/constant.dart';

class CustomNetworkImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  const CustomNetworkImage(
      {required this.image, this.height, this.width, this.boxFit, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        placeholder: const AssetImage(AssetsManager.appLogo),
        image: NetworkImage(image),
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            AssetsManager.appLogo,
        height: height,
        width: width,
        fit: boxFit
          );
        },
        height: height,
        width: width,
        fit: boxFit);
  }
}
