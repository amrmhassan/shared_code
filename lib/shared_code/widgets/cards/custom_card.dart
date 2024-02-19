// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shared_code/shared_code/constants/sizes.dart';
import 'package:shared_code/shared_code/widgets/buttons/button_wrapper.dart';

Color defaultShadowColor = Colors.grey.withOpacity(.2);

class CustomCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? hPadFactor;
  final double? vPadFactor;
  final double? borderRadius;
  final EdgeInsets? margin;
  final VoidCallback? onLongPress;
  final double? width;
  final double? height;

  final Color? backgroundColor;
  final Clip? clipBehavior;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final Color? shadowColor;
  final Alignment? alignment;

  const CustomCard({
    Key? key,
    required this.child,
    this.onTap,
    this.hPadFactor,
    this.vPadFactor,
    this.borderRadius,
    this.margin,
    this.onLongPress,
    this.width,
    this.height,
    this.backgroundColor,
    this.clipBehavior,
    this.decoration,
    this.padding,
    this.shadowColor,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      alignment: alignment,
      clipBehavior: clipBehavior,
      margin: margin,
      onTap: onTap,
      onLongPress: onLongPress,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: kHPad * (hPadFactor ?? 1),
            vertical: (kVPad / 2) * (vPadFactor ?? 1),
          ),
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 1000),
            color: backgroundColor ?? Colors.white,
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? defaultShadowColor,
                blurRadius: 10,
              ),
            ],
          ),
      width: width ?? double.infinity,
      height: height,
      child: child,
    );
  }
}
