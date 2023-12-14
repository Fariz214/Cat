
import 'package:ckm/common/widgets/header_widget/edges.dart';
import 'package:flutter/material.dart';

class CurvedEgdes extends StatelessWidget {
  const CurvedEgdes({
    super.key, required this.child
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomEdges(),
      child: child,
    );
  }
}