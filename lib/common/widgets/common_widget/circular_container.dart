
import 'package:ckm/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.child,
    this.padding = 0,
    this.margin,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.backgroundColor = CKMColors.light,
  });

  final double? width; 
  final double? height;
  final double padding;
  final double radius;
  final Color backgroundColor;
  final EdgeInsets? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}