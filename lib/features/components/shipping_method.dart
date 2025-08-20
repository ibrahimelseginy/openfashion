import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashon/features/components/custom_container.dart';
import 'custom_text.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Shipping Method".toUpperCase(),
          color: Colors.black38,
          size: 16,
        ),
        Gap(20),
        CustomContainer(
          text: "Pickup at store",
          icon: Icons.keyboard_arrow_down_sharp,
        ),
        Gap(50),
      ],
    );
  }
}
