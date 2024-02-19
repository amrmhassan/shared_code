import 'package:flutter/material.dart';
import 'package:shared_code/shared_code/constants/sizes.dart';

class VSpace extends StatelessWidget {
  final double factor;
  const VSpace({Key? key, this.factor = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: kVPad * factor);
  }
}
