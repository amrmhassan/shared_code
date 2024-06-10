import 'package:flutter/material.dart';

class VLine extends StatelessWidget {
  final double? thickness;
  final Color? color;
  final double? borderRadius;
  final double? heightFactor;
  final double? height;

  const VLine({
    Key? key,
    this.color,
    this.thickness,
    this.borderRadius,
    this.heightFactor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: heightFactor ?? 1,
      child: Container(
        width: thickness ?? 2,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
      ),
    );
  }
}
