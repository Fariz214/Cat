import 'package:ckm/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class TextCategory extends StatelessWidget {
  const TextCategory({
    super.key,
    this.color,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.categoryTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes categoryTextSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines, 
      overflow: TextOverflow.ellipsis,
      style: categoryTextSize == TextSizes.small
        ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
        : categoryTextSize == TextSizes.medium
            ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
            : categoryTextSize == TextSizes.large
                ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}