// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_code_new/shared_code_new.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWrapper extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? backgroundColor;
  final Color? baseColor;
  final Color? highlightColor;
  const ShimmerWrapper({
    super.key,
    required this.width,
    required this.height,
    this.radius = mediumBorderRadius,
    this.backgroundColor,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.black,
      highlightColor: highlightColor ?? Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
