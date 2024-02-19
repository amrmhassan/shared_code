// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_code/shared_code.dart';

class FancyTextField extends StatefulWidget {
  final String hint;
  final String? iconPath;
  final TextInputType? inputType;
  final bool password;
  final bool autoFocus;
  final Function(String value)? onChange;
  final TextEditingController? controller;
  final String? errorText;
  final Widget? trailingIcon;
  final TextInputAction? textInputAction;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final Widget? leading;
  final EdgeInsets? padding;
  final String? hidePasswordSvgPath;
  final String? showPasswordSvgPath;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderRadius;
  final Color? backgroundColor;
  final InputDecoration? inputDecoration;
  final BoxDecoration? decoration;
  final FocusNode? focusNode;
  final Color? eyeColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  const FancyTextField({
    Key? key,
    required this.hint,
    this.iconPath,
    this.inputType,
    this.password = false,
    this.autoFocus = false,
    this.onChange,
    this.controller,
    this.errorText,
    this.trailingIcon,
    this.textInputAction,
    this.enabled = true,
    this.maxLines,
    this.minLines,
    this.leading,
    this.padding,
    this.hidePasswordSvgPath,
    this.showPasswordSvgPath,
    this.inputFormatters,
    this.borderRadius,
    this.backgroundColor,
    this.inputDecoration,
    this.decoration,
    this.focusNode,
    this.eyeColor,
    this.textStyle,
    this.hintStyle,
  }) : super(key: key);

  @override
  State<FancyTextField> createState() => _FancyTextFieldState();
}

class _FancyTextFieldState extends State<FancyTextField> {
  bool passwordShown = false;
  void togglePasswordShown() {
    setState(() {
      passwordShown = !passwordShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      focusNode: widget.focusNode,
      decoration: widget.decoration,
      inputDecoration: widget.inputDecoration,
      inputFormatters: widget.inputFormatters,
      minLines: widget.minLines,
      title: widget.hint,
      enabled: widget.enabled,
      errorText: widget.errorText,
      controller: widget.controller,
      onChange: widget.onChange,
      autoFocus: widget.autoFocus,
      keyboardType: widget.inputType,
      textInputAction: widget.textInputAction,
      password: widget.password,
      handleShowPassword: togglePasswordShown,
      maxLines: widget.maxLines,
      obscureText: !passwordShown && widget.password,
      backgroundColor:
          widget.backgroundColor ?? customColors.textFieldBackgroundColor,
      borderColor: Colors.transparent,
      textStyle: widget.textStyle ?? bodySmall(context),
      hintStyle: widget.hintStyle,
      borderRadius:
          BorderRadius.circular(widget.borderRadius ?? mediumBorderRadius),
      leadingIcon: widget.leading ??
          (widget.iconPath == null
              ? null
              : TextFieldLeadingIcon(
                  iconPath: widget.iconPath,
                )),
      trailingIcon: widget.trailingIcon ?? passwordEye(widget.eyeColor),
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: kHPad / 2),
    );
  }

  Widget? passwordEye(Color? eyeColor) {
    return widget.password && passwordShown
        ? GestureDetector(
            onTap: togglePasswordShown,
            child: SvgPicture.asset(
              widget.hidePasswordSvgPath ?? 'assets/svg/eye-closed.svg',
              colorFilter: eyeColor == null
                  ? null
                  : ColorFilter.mode(eyeColor, BlendMode.srcIn),
            ),
          )
        : widget.password && !passwordShown
            ? GestureDetector(
                onTap: togglePasswordShown,
                child: SvgPicture.asset(
                  widget.showPasswordSvgPath ?? 'assets/svg/eye-open.svg',
                  color: eyeColor,
                  colorFilter: eyeColor == null
                      ? null
                      : ColorFilter.mode(eyeColor, BlendMode.srcIn),
                ),
              )
            : null;
  }
}

class TextFieldLeadingIcon extends StatelessWidget {
  final String? iconPath;
  const TextFieldLeadingIcon({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        smallPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(mediumBorderRadius),
      ),
      child: SvgPicture.asset(
        iconPath!,
        width: mediumIconSize * .8,
        colorFilter: ColorFilter.mode(
          customColors.blueColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
