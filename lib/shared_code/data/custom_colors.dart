import 'package:flutter/material.dart';

class CustomColors {
  final Color blackColor;
  final Color primaryColor;
  final Color secondaryColor;
  final Color lightColor;

  //? material colors
  final Color backgroundColor;
  final Color cardBackgroundColor;
  final Color cardBackgroundColorDark;
  final Color lightCardBackgroundColor;
  final Color inactiveColor;
  final Color blueColor;
  final Color textFieldBackgroundColor;
  //? icons colors

  final Color mainIconColor;
  final Color dangerColor;
  final Color greenColor;

  //? text colors
  final Color activeTextColor;
  final Color inactiveTextColor;

  const CustomColors(
      {this.blackColor = const Color(0xFF362B4B),
      this.primaryColor = const Color(0xFFAA18FF),
      this.secondaryColor = const Color(0xFF9B89B3),
      this.lightColor = const Color(0xFFFEF6FF),
      this.backgroundColor = const Color(0xffF7FBFE),
      this.cardBackgroundColor = const Color(0xffFFFFFF),
      this.cardBackgroundColorDark = const Color(0xff878F7B),
      this.lightCardBackgroundColor = const Color(0xff474B63),
      this.inactiveColor = const Color(0xff9A9CA3),
      this.blueColor = const Color(0xff545FDD),
      this.textFieldBackgroundColor = const Color(0xffF5F7F9),
      this.dangerColor = const Color(0xffF85D5E),
      this.greenColor = const Color(0xff33C781),
      this.mainIconColor = const Color(0xff545FDD),
      this.activeTextColor = const Color.fromARGB(255, 29, 40, 95),
      this.inactiveTextColor = const Color.fromARGB(255, 141, 148, 186)});
}
