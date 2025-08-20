import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashon/core/constants.dart';

class AppSpacing {
  static const Widget xs = Gap(AppConstants.paddingXS);
  static const Widget s = Gap(AppConstants.paddingS);
  static const Widget m = Gap(AppConstants.paddingM);
  static const Widget l = Gap(AppConstants.paddingL);
  static const Widget xl = Gap(AppConstants.paddingXL);
  static const Widget xxl = Gap(AppConstants.paddingXXL);
  static const Widget xxxl = Gap(AppConstants.paddingXXXL);

  // Custom spacing
  static Widget custom(double size) => Gap(size);

  // Responsive spacing
  static Widget responsive(BuildContext context, {double factor = 0.02}) {
    return Gap(MediaQuery.of(context).size.height * factor);
  }
}
