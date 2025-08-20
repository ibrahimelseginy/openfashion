import 'package:flutter/material.dart';
import 'package:openfashon/core/constants.dart';
import 'package:openfashon/features/components/custom_text.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isFree;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomContainer({
    super.key,
    required this.text,
    required this.icon,
    this.isFree = false,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            padding ??
            const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingL,
              vertical: AppConstants.paddingM,
            ),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey.shade100,
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppConstants.borderRadiusL,
          ),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomText(text: text, color: textColor ?? Colors.black),
            ),
            if (isFree) ...[
              CustomText(text: "FREE", color: textColor ?? Colors.black),
              const SizedBox(width: AppConstants.paddingM),
            ],
            Icon(icon, color: iconColor),
          ],
        ),
      ),
    );
  }
}
