import 'package:ckm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxiExtent =288,
    });

    final int itemCount;
    final double? mainAxiExtent;
    final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: mainAxiExtent,
        mainAxisSpacing: CKMSizes.gridViewSpacing,
        crossAxisSpacing: CKMSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}