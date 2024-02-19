// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_code/shared_code/constants/sizes.dart';
import 'package:shared_code/shared_code/constants/styles.dart';
import 'package:shared_code/shared_code/data/runtime_variables.dart';
import '../buttons/button_wrapper.dart';

class ApplyModalButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool active;
  final Color? color;

  const ApplyModalButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.active = true,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      backgroundColor: customColors.blueColor,
      active: active,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: kVPad / 2),
      onTap: onTap,
      child: Text(
        title,
        style: bodyMedium(context).copyWith(color: Colors.white),
      ),
    );
  }
}
