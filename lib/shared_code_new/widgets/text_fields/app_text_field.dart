// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_code_new/shared_code_new.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final bool password;
  final String? error;
  final bool enabled;
  final String? svgIconPath;
  final Function(String value)? onChange;
  final Widget? trailingWidget;
  final bool autoFocus;
  final TextInputType? textInputType;
  final bool web;
  final int? maxLines;
  final int? minLines;

  const AppTextField({
    super.key,
    required this.hint,
    this.controller,
    this.password = false,
    this.error,
    this.enabled = true,
    this.svgIconPath,
    this.onChange,
    this.trailingWidget,
    this.autoFocus = false,
    this.textInputType,
    this.web = false,
    this.maxLines,
    this.minLines,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode focusNode = FocusNode();

  Color borderColor = Colors.transparent;
  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        borderColor = primaryColor(context);
      } else {
        borderColor = Colors.transparent;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FancyTextField(
      inputType: widget.textInputType,
      autoFocus: widget.autoFocus,
      onChange: widget.onChange,
      trailingIcon: widget.trailingWidget ??
          (widget.svgIconPath == null
              ? null
              : SvgPicture.asset(
                  widget.svgIconPath!,
                  colorFilter: ColorFilter.mode(
                    hintColor(context),
                    BlendMode.srcIn,
                  ),
                )),
      enabled: widget.enabled,
      errorText: widget.error,
      password: widget.password,
      showPasswordSvgPath: widget.web
          ? 'web/assets/svgs/eye-open.svg'
          : 'assets/svgs/eye-open.svg',
      hidePasswordSvgPath: widget.web
          ? 'web/assets/svgs/eye-closed.svg'
          : 'assets/svgs/eye-closed.svg',
      focusNode: focusNode,
      hint: widget.hint,
      borderRadius: 16,
      padding: EdgeInsets.zero,
      backgroundColor: cardColor(context),
      controller: widget.controller,
      textStyle: bodyMedium(context),
      eyeColor: hintColor(context),
      maxLines: widget.maxLines,
      minLines: widget.maxLines,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(largeBorderRadius * .8),
        color: cardColor(context),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
    );
  }
}
