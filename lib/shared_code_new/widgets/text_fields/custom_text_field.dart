// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_code_new/shared_code_new.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String? iconName;
  final Function(String v)? onChange;
  final String? trailingIconName;
  final Widget? trailingIconWidget;
  final Color? color;
  final Color? borderColor;
  final EdgeInsets? padding;
  final Color? trailingIconColor;
  final bool autoFocus;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool password;
  final VoidCallback? handleShowPassword;
  final TextInputAction? textInputAction;
  final String? errorText;
  final String? Function(String? v)? validator;
  final bool enabled;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool? requiredField;
  final BorderRadius? borderRadius;
  final int? maxLines;
  final int? minLines;
  final String? initialValue;
  final Widget? trailingIcon;
  final int? maxLength;
  final Widget? Function(
    BuildContext, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  })? buildCounter;
  final BoxDecoration? decoration;
  final Function(String v)? onSubmitted;
  final Color? backgroundColor;
  final Widget? leadingIcon;
  final bool? obscureText;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final CrossAxisAlignment? crossAxisAlignment;
  final InputDecoration? inputDecoration;

  const CustomTextField({
    Key? key,
    required this.title,
    this.iconName,
    this.onChange,
    this.trailingIconName,
    this.trailingIconWidget,
    this.color,
    this.borderColor,
    this.padding,
    this.trailingIconColor,
    this.autoFocus = false,
    this.controller,
    this.keyboardType,
    this.password = false,
    this.handleShowPassword,
    this.textInputAction,
    this.errorText,
    this.validator,
    this.enabled = true,
    this.textStyle,
    this.hintStyle,
    this.requiredField,
    this.borderRadius,
    this.maxLines,
    this.minLines,
    this.initialValue,
    this.trailingIcon,
    this.maxLength,
    this.decoration,
    this.onSubmitted,
    this.backgroundColor,
    this.leadingIcon,
    this.obscureText,
    this.focusNode,
    this.inputFormatters,
    this.crossAxisAlignment,
    this.inputDecoration,
    this.buildCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      padding: padding ?? EdgeInsets.symmetric(horizontal: kHPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (requiredField == true)
                Text(
                  '*',
                  style: TextStyle(
                    height: 1,
                    color: customColors.dangerColor,
                    fontSize: h2TextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Expanded(
                child: Container(
                  decoration: decoration ??
                      BoxDecoration(
                        color: backgroundColor,
                        borderRadius: borderRadius ??
                            BorderRadius.circular(smallBorderRadius),
                        border: Border.all(
                          width: 1,
                          color: errorText == null
                              ? (borderColor ?? customColors.inactiveColor)
                              : customColors.dangerColor,
                        ),
                      ),
                  padding: EdgeInsets.symmetric(
                    horizontal: kHPad / 2,
                    // vertical: kVPad / 2,
                  ),
                  child: Row(
                    crossAxisAlignment:
                        crossAxisAlignment ?? CrossAxisAlignment.center,
                    children: [
                      if (iconName != null)
                        Image.asset(
                          'assets/icons/$iconName.png',
                          width: mediumIconSize,
                          color: errorText == null
                              ? (color ?? customColors.inactiveColor)
                              : customColors.dangerColor,
                        )
                      else if (leadingIcon != null)
                        leadingIcon!,
                      HSpace(factor: .5),
                      Expanded(
                        child: Material(
                          color: backgroundColor ?? Colors.white,
                          child: TextFormField(
                            focusNode: focusNode,
                            inputFormatters: inputFormatters,
                            onFieldSubmitted: onSubmitted,
                            maxLength: maxLength,
                            maxLines: maxLines ?? 1,
                            buildCounter: buildCounter,
                            minLines: minLines ?? 1,
                            enabled: enabled,
                            validator: validator,
                            textInputAction:
                                textInputAction ?? TextInputAction.next,
                            obscureText: obscureText ?? false,
                            autocorrect: !password,
                            controller: controller,
                            onChanged: onChange,
                            autofocus: autoFocus,
                            keyboardType: keyboardType,
                            style: textStyle ?? bodyMedium(context),
                            decoration: inputDecoration ??
                                InputDecoration(
                                  border: InputBorder.none,
                                  hintText: title,
                                  hintStyle: errorText == null
                                      ? (hintStyle ?? bodyMedium(context))
                                      : bodyMedium(context).copyWith(
                                          color: customColors.dangerColor,
                                        ),
                                ),
                          ),
                        ),
                      ),
                      if (trailingIcon != null) trailingIcon!,
                      if (trailingIconName != null)
                        GestureDetector(
                          onTap: handleShowPassword,
                          child: Image.asset(
                            'assets/icons/$trailingIconName.png',
                            width: mediumIconSize,
                            color:
                                trailingIconColor ?? customColors.inactiveColor,
                          ),
                        ),
                      if (trailingIconWidget != null) trailingIconWidget!
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (errorText != null)
            Text(
              errorText.toString(),
              style:
                  bodyMedium(context).copyWith(color: customColors.dangerColor),
            ),
        ],
      ),
    );
  }
}

class ReadyInputFormatter {
  static FilteringTextInputFormatter onlyDouble =
      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'));
  static FilteringTextInputFormatter onlyInt =
      FilteringTextInputFormatter.allow(RegExp(r'^\d*$'));
}
