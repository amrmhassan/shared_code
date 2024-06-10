// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shared_code_new/shared_code_new/helper/responsive.dart';
import 'package:shared_code_new/shared_code_new/widgets/spaces/padding_wrapper.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final PreferredSizeWidget? appBar;
  final bool scroll;

  const ScreenWrapper({
    Key? key,
    required this.child,
    this.padding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.appBar,
    this.scroll = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var safeArea = SafeArea(
      child: Container(
        constraints: BoxConstraints(
          minHeight: Responsive.getCleanHeight(context),
        ),
        child: PaddingWrapper(
          padding: padding,
          child: child,
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: scroll
          ? SingleChildScrollView(
              child: safeArea,
            )
          : safeArea,
    );
  }
}
