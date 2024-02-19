// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_code/shared_code.dart';

class AppMainButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool active;
  final String? title;
  final Widget? child;
  final double? height;
  final double? width;
  final double? borerRadius;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final TextStyle? style;
  const AppMainButton({
    Key? key,
    required this.onTap,
    this.active = true,
    this.title,
    this.child,
    this.height,
    this.width,
    this.borerRadius,
    this.backgroundColor,
    this.padding,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: active ? 1 : .2,
      child: MainButton(
        height: height,
        width: width,
        onTap: active ? onTap : null,
        title: title,
        backgroundColor: backgroundColor ?? primaryColor(context),
        borerRadius: borerRadius ?? largeBorderRadius * .8,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: kVPad * .8,
            ),
        style: style,
        child: child,
      ),
    );
  }
}
