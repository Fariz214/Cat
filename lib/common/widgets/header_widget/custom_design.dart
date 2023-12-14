
import 'package:ckm/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDesign extends StatelessWidget {
  const CustomDesign({
    super.key,
    this.child,
    this.width=70,
    this.height=1000,
    this.padding=0,
    this.radius=400,
    this.backgroundColor = CKMColors.white,
  });
  
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: child,
    );
  }
}