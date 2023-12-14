import 'package:ckm/features/application/screens/add/text_category.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/enums.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NameCategory extends StatelessWidget {
  const NameCategory({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = CKMColors.dark,
    this.textAlign = TextAlign.center,
    this.categoryTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes categoryTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize:  MainAxisSize.min,
      children: [
        Flexible(
          child: TextCategory(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            categoryTextSize: categoryTextSize,
        )
      ),

      const SizedBox(width: CKMSizes.xs),
      Icon(Iconsax.timer, color: iconColor, size: CKMSizes.iconXs,)
        
      ],
    );
  }
}