// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_code_new/shared_code_new.dart';

class MainButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final bool active;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;
  final Widget? child;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final TextStyle? style;
  final Widget? icon;
  final double? borerRadius;
  final Border? border;
  final EdgeInsets? margin;

  const MainButton({
    this.onTap,
    super.key,
    this.title,
    this.active = true,
    this.width,
    this.height,
    this.boxShadow,
    this.child,
    this.padding,
    this.backgroundColor,
    this.style,
    this.icon,
    this.borerRadius,
    this.border,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      margin: margin,
      alignment: Alignment.center,
      width: width,
      height: height,
      active: active,
      onTap: onTap,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: kHPad,
            vertical: kVPad / 2,
          ),
      borderRadius: borerRadius ?? 1000,
      border: border,
      backgroundColor: backgroundColor ?? customColors.blueColor,
      child: child ??
          (icon == null
              ? Text(
                  title ?? '',
                  style: style ?? bodyLarge(context),
                )
              : Row(
                  children: [
                    icon!,
                    Text(
                      title ?? '',
                      style: style ?? bodyLarge(context),
                    )
                  ],
                )),
    );
  }
}
