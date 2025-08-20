import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:openfashon/core/colors.dart';
import 'custom_text.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Center(
          child: CustomText(
            text: title.toUpperCase(),
            color: AppColors.secondary,
            spacing: 4,
            size: 20,
          ),
        ),
        Gap(10),
        Image.asset("assets/svgs/line.png", width: 100, color: Colors.black),
        Gap(20),
      ],
    );
  }
}
