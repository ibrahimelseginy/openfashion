import 'package:flutter/material.dart';
import 'package:openfashon/features/components/custom_text.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;

  const SectionHeader({
    super.key,
    required this.title,
    this.color,
    this.fontSize,
    this.maxLines,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: CustomText(
        text: title.toUpperCase(),
        color: color ?? Colors.black38,
        size: fontSize ?? 16,
        max: maxLines ?? 2,
      ),
    );
  }
}
