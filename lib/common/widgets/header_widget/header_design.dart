import 'package:ckm/common/widgets/header_widget/curved_edges.dart';
import 'package:ckm/common/widgets/header_widget/custom_design.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HeaderDesign extends StatelessWidget {
  const HeaderDesign({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    return CurvedEgdes(
      child: SizedBox(
        child: Container(
          color: dark? CKMColors.dark : CKMColors.primary,
          child: Stack(
            children: [
              Positioned(
                  top: -250,
                  right: 10,
                  child: CustomDesign(
                      backgroundColor: dark? CKMColors.secondary.withOpacity(0.8): CKMColors.black.withOpacity(0.8))),
              Positioned(
                  top: -250,
                  right: 100,
                  child: CustomDesign(
                      backgroundColor: dark? CKMColors.white.withOpacity(0.8): CKMColors.white.withOpacity(0.8))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
