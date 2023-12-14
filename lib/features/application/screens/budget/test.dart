import 'package:flutter/material.dart';

class SliverPieChartDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  SliverPieChartDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 200; // Height of your pie chart

  @override
  double get minExtent => 200; // Height of your pie chart

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
