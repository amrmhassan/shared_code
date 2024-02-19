import 'package:flutter/material.dart';
import 'package:shared_code/shared_code/constants/styles.dart';
import 'package:shared_code/shared_code/widgets/shimmer/shimmer_wrapper.dart';

class AppShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  const AppShimmer({
    super.key,
    this.width,
    this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      radius: radius ?? 10000,
      width: width ?? 100,
      height: height ?? 4,
      highlightColor: Colors.white.withOpacity(.5),
      baseColor: cardColor(context),
    );
  }
}
