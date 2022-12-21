import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/core/services/extension/dimen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/constant.dart';

class CustomShimmerImage extends StatelessWidget {
  const CustomShimmerImage({
    Key? key,
    this.height,
    this.width,
    this.boxFit,
    this.radius,
    required this.image,
  }) : super(key: key);

  final String image;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ??BorderRadius.circular(0),
      child: CachedNetworkImage(
        height: height ?? 128.h,
        width: width?? double.infinity,
        fit: boxFit ?? BoxFit.cover,
        imageUrl: image,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[850]!,
          highlightColor: Colors.grey[800]!,
          child: Container(
            height:height ?? 128.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorManager.lightBlack,
             shape: BoxShape.circle
            ),
          ),
        ),
        errorWidget: (context, url, error) => Shimmer.fromColors(
          baseColor: Colors.grey[400]!,
          highlightColor: ColorManager.lightBlack,
          child: Container(
            height: height ?? 128.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.lightBlack,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
