// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shared_code/shared_code/constants/sizes.dart';
import 'package:shared_code/shared_code/constants/styles.dart';
import 'package:shared_code/shared_code/data/runtime_variables.dart';

import '../buttons/button_wrapper.dart';
import '../spaces/h_space.dart';
import 'modal_wrapper.dart';
import '../spaces/v_space.dart';

class DoubleButtonsModal extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final VoidCallback onOk;
  final VoidCallback? onCancel;
  final String? okText;
  final String? cancelText;
  final Color? okColor;
  final Color? cancelColor;
  final bool autoPop;
  final bool reverseButtonsOrder;
  final Widget? extra;
  final TextStyle? titleStyle;
  final bool showCancelButton;
  final Widget? titleIcon;
  final bool? okActive;
  final Color? backgroundColor;

  const DoubleButtonsModal({
    Key? key,
    required this.onOk,
    this.title,
    this.onCancel,
    this.subTitle,
    this.okText,
    this.cancelText,
    this.okColor,
    this.cancelColor,
    required this.autoPop,
    this.reverseButtonsOrder = false,
    this.okActive,
    this.extra,
    this.showCancelButton = true,
    this.titleStyle,
    this.titleIcon,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var modalButtons = [
      if (showCancelButton)
        Expanded(
          child: ButtonWrapper(
            onTap: () {
              if (onCancel != null) onCancel!();
              if (autoPop) {
                Navigator.pop(context);
              }
            },
            padding: EdgeInsets.symmetric(
                horizontal: kHPad / 2, vertical: kVPad / 2),
            backgroundColor: cancelColor ?? customColors.backgroundColor,
            child: Text(
              cancelText ?? 'Cancel',
              style: bodySmall(context).copyWith(color: Colors.white),
            ),
          ),
        ),
      if (showCancelButton) HSpace(),
      Expanded(
        child: ButtonWrapper(
          active: okActive ?? true,
          onTap: () async {
            onOk();
            if (autoPop) {
              Navigator.pop(context);
            }
          },
          padding:
              EdgeInsets.symmetric(horizontal: kHPad / 2, vertical: kVPad / 2),
          backgroundColor: okColor ?? customColors.dangerColor,
          child: Text(
            okText ?? 'Delete',
            style: bodySmall(context).copyWith(color: Colors.white),
          ),
        ),
      ),
    ];
    return ModalWrapper(
      showTopLine: false,
      color: backgroundColor?? customColors.cardBackgroundColor,
      child: Column(
        children: [
          if (title != null)
            Row(
              children: [
                if (titleIcon != null) titleIcon!,
                Text(
                  title!,
                  style: titleStyle ?? bodyMedium(context),
                ),
              ],
            ),
          if (subTitle != null)
            Row(
              children: [
                Expanded(
                  child: Text(
                    subTitle.toString(),
                    style: bodySmall(context),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          if (extra != null) extra! else VSpace(),
          Row(
            children: reverseButtonsOrder
                ? modalButtons.reversed.toList()
                : modalButtons,
          ),
        ],
      ),
    );
  }
}
