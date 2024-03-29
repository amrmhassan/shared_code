import 'package:flutter/material.dart';

class HLine extends StatelessWidget {
  final double? thickness;
  final Color? color;
  final double? borderRadius;
  final double? widthFactor;
  final double? width;
  final Widget? overlay;
  final Alignment? alignment;

  const HLine({
    Key? key,
    this.color,
    this.thickness,
    this.borderRadius,
    this.widthFactor,
    this.width,
    this.overlay,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor ?? 1,
      child: Stack(
        alignment: alignment ?? AlignmentDirectional.topStart,
        children: [
          Container(
            width: width ?? double.infinity,
            height: thickness ?? 2,
            decoration: BoxDecoration(
              color: color ?? Colors.white,
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            ),
          ),
          if (overlay != null) overlay!
        ],
      ),
    );
  }
}
