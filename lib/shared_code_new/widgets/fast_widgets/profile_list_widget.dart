// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_code_new/shared_code_new/constants/styles.dart';
import 'package:shared_code_new/shared_code_new/widgets/cards/custom_card.dart';
import 'package:shared_code_new/shared_code_new/widgets/spaces/spaces.dart';

class ProfileListWidget extends StatelessWidget {
  final String iconName;
  final String title;
  final VoidCallback onTap;
  const ProfileListWidget({
    Key? key,
    required this.iconName,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        onTap: onTap,
        margin: EdgeInsets.only(bottom: 18),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/$iconName.png',
              width: 24,
              height: 24,
              color: hintColor(context),
            ),
            WidthSpace(12),
            Text(
              title,
              style: bodySmall(context).copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ));
  }
}
