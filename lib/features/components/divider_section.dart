import 'package:flutter/material.dart';
import 'package:openfashon/features/components/spacing.dart';

class DividerSection extends StatelessWidget {
  final Color? color;
  final double? thickness;
  final EdgeInsetsGeometry? margin;

  const DividerSection({super.key, this.color, this.thickness, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          Divider(color: color ?? Colors.grey.shade300, thickness: thickness),
          AppSpacing.l,
          Divider(color: color ?? Colors.grey.shade300, thickness: thickness),
        ],
      ),
    );
  }
}
