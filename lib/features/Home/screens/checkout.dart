import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:openfashon/core/colors.dart';
import 'package:openfashon/features/Home/screens/place_order.dart';
import 'package:openfashon/features/components/cart_widget.dart';
import 'package:openfashon/features/components/custom_appbar.dart';
import 'package:openfashon/features/components/custom_button.dart';
import 'package:openfashon/features/components/custom_text.dart';
import 'package:openfashon/features/components/header.dart';

// إضافة كلاس PlaceOrderArgs
class PlaceOrderArgs {
  final String image;
  final String name;
  final String desp;
  final int qty;
  final int price;
  final int total;

  PlaceOrderArgs({
    required this.image,
    required this.name,
    required this.desp,
    required this.qty,
    required this.price,
    required this.total,
  });
}

class Checkout extends StatefulWidget {
  const Checkout({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.descp,
  });
  final String image;
  final String name;
  final int price;
  final String descp;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int selectedQty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Header(title: "Checkout"),

            CartWidget(
              image: widget.image,
              name: widget.name,
              descp: widget.descp,
              price: widget.price * selectedQty,
              qty: selectedQty,
              onChanged: (v) {
                setState(() {
                  selectedQty = v;
                });
              },
            ),

            promo(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Est. Total", color: AppColors.textPrimary),
                CustomText(
                  text: "\$ ${widget.price * selectedQty}",
                  color: Colors.red.shade200,
                ),
              ],
            ),
            Gap(20),
            Button(
              isSvgg: true,
              title: "Checkout",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceOrder(
                      image: widget.image,
                      name: widget.name,
                      desp: widget.descp,
                      qty: selectedQty,
                      price: widget.price,
                      total: widget.price * selectedQty,
                    ),
                  ),
                );
              },
            ),
            Gap(70),
          ],
        ),
      ),
    );
  }
}

Widget promo() {
  return Column(
    children: [
      Gap(20),
      Divider(),
      Gap(20),
      Row(
        children: [
          SvgPicture.asset("assets/svgs/promo.svg", width: 28),
          Gap(20),
          CustomText(text: "ADD Promo Code", color: AppColors.secondary),
        ],
      ),
      Gap(20),
      Divider(),
      Gap(20),
      Row(
        children: [
          SvgPicture.asset("assets/svgs/delivery.svg", width: 25),
          Gap(20),
          CustomText(text: "Delivery", color: AppColors.secondary),
          Spacer(),
          CustomText(text: "FREE", color: AppColors.success),
          Gap(5),
        ],
      ),
      Gap(10),
      Divider(),
    ],
  );
}
