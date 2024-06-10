// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shared_code_new/shared_code_new/constants/sizes.dart';
import 'package:shared_code_new/shared_code_new/widgets/modals/apply_modal_button.dart';

import '../lines/h_line.dart';
import '../spaces/padding_wrapper.dart';
import '../spaces/v_space.dart';

class ModalWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onApply;
  final String? applyButtonTitle;
  final Color? color;
  final bool applyActive;
  final double? afterLinePaddingFactor;
  final double? bottomPaddingFactor;
  final bool showTopLine;
  final Color? applyButtonColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Clip? clip;

  const ModalWrapper({
    Key? key,
    required this.child,
    this.onApply,
    this.applyButtonTitle,
    this.applyActive = true,
    this.color,
    this.afterLinePaddingFactor,
    this.bottomPaddingFactor,
    this.showTopLine = true,
    this.applyButtonColor,
    this.borderRadius,
    this.clip,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return PaddingWrapper(
      clip: clip,
      margin: EdgeInsets.only(bottom: bottomPadding),
      padding: padding ??
          EdgeInsets.only(
            right: kHPad,
            left: kHPad,
          ),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? largeBorderRadius),
          topRight: Radius.circular(borderRadius ?? largeBorderRadius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showTopLine)
            Column(
              children: [
                VSpace(),
                HLine(
                  thickness: 4,
                  borderRadius: 50,
                  widthFactor: .3,
                ),
              ],
            ),
          VSpace(factor: afterLinePaddingFactor ?? 2),
          child,
          VSpace(factor: bottomPaddingFactor ?? 2),
          if (onApply != null && applyButtonTitle != null)
            ApplyModalButton(
                color: applyButtonColor,
                active: applyActive,
                onTap: () {
                  onApply!();
                  Navigator.pop(context);
                },
                title: applyButtonTitle.toString()),
          if (onApply != null && applyButtonTitle != null) VSpace(factor: 2),
        ],
      ),
    );
  }
}
