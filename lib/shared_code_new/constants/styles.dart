// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

TextStyle bodyLarge(BuildContext context) {
  return Theme.of(context).textTheme.bodyLarge ?? TextStyle();
}

TextStyle bodySmall(BuildContext context) {
  return Theme.of(context).textTheme.bodySmall ?? TextStyle();
}

TextStyle bodyMedium(BuildContext context) {
  return Theme.of(context).textTheme.bodyMedium ?? TextStyle();
}

TextStyle headlineSmall(BuildContext context) {
  return Theme.of(context).textTheme.headlineSmall ?? TextStyle();
}

TextStyle headlineMedium(BuildContext context) {
  return Theme.of(context).textTheme.headlineMedium ?? TextStyle();
}

TextStyle displayLarge(BuildContext context) {
  return Theme.of(context).textTheme.displayLarge ?? TextStyle();
}

TextStyle displayMedium(BuildContext context) {
  return Theme.of(context).textTheme.displayMedium ?? TextStyle();
}

TextStyle displaySmall(BuildContext context) {
  return Theme.of(context).textTheme.displaySmall ?? TextStyle();
}

Color primaryColor(BuildContext context) {
  return Theme.of(context).primaryColor;
}

Color secondaryColor(BuildContext context) {
  return Theme.of(context).secondaryHeaderColor;
}

Color hintColor(BuildContext context) {
  return Theme.of(context).hintColor;
}

Color cardColor(BuildContext context) {
  return Theme.of(context).cardColor;
}

Color highlightColor(BuildContext context) {
  return Theme.of(context).highlightColor;
}

Color dividerColor(BuildContext context) {
  return Theme.of(context).dividerColor;
}



Color scaffoldColor(BuildContext context) {
  return Theme.of(context).scaffoldBackgroundColor;
}
