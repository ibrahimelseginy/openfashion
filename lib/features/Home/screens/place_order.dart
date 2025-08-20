import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openfashon/core/colors.dart';
import 'package:openfashon/core/constants.dart';
import 'package:openfashon/features/Home/screens/add_address.dart';
import 'package:openfashon/features/components/address_info.dart';
import 'package:openfashon/features/components/app_routers.dart';
import 'package:openfashon/features/components/cart_widget.dart';
import 'package:openfashon/features/components/custom_appbar.dart';
import 'package:openfashon/features/components/custom_button.dart';
import 'package:openfashon/features/components/custom_text.dart';
import 'package:openfashon/features/components/dailog.dart';
import 'package:openfashon/features/components/header.dart';
import 'package:openfashon/features/components/shipping_method.dart';
import 'package:openfashon/features/components/spacing.dart';
import 'package:openfashon/features/components/custom_container.dart';
import 'package:openfashon/features/components/section_header.dart';
import 'package:openfashon/features/components/divider_section.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    super.key,
    required this.image,
    required this.name,
    required this.desp,
    required this.qty,
    required this.total,
    required this.price,
  });

  final String image;
  final String name;
  final int price;
  final String desp;
  final int qty;
  final int total;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic _savedAddress;
  dynamic _savedCard;
  late int selectedQty;

  @override
  void initState() {
    selectedQty = widget.qty;
    super.initState();
  }

  /// Address methods
  void _openAddress(BuildContext context) async {
    final addressData = await Navigator.pushNamed(context, AppRoutes.addAddress);
    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }

  void _editAddress() async {
    final newAddress = await Navigator.pushNamed(
      context,
      AppRoutes.addAddress,
      arguments: AddAddress(editData: _savedAddress),
    );

    setState(() {
      _savedAddress = newAddress;
    });
  }

  /// Card methods
  void _openCard() async {
    final cardData = await Navigator.pushNamed(context, AppRoutes.addCard);
    if (cardData != null) {
      setState(() {
        _savedCard = cardData;
      });
    }
  }

  /// Build methods
  Widget _buildAddressSection() {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Column(
        children: [
          if (_savedAddress != null)
            AddressInfo(savedAddress: _savedAddress, onTap: _editAddress),
          AppSpacing.s,
          if (_savedAddress == null)
            CustomContainer(
              text: "Add shipping address",
              icon: Icons.add,
              onTap: () => _openAddress(context),
            ),
        ],
      ),
    );
  }

  Widget _buildPaymentSection() {
    if (_savedCard == null) {
      return CustomContainer(
        text: "Select Payment Method",
        icon: Icons.keyboard_arrow_down_sharp,
        onTap: _openCard,
      );
    }

    return Column(
      children: [
        DividerSection(),
        Row(
          children: [
            SvgPicture.asset(
              "assets/svgs/Mastercard.svg",
              width: AppConstants.iconSizeM,
            ),
            AppSpacing.s,
            const CustomText(text: "Master Card ending", color: Colors.black),
            AppSpacing.s,
            CustomText(
              text:
                  "••••${_savedCard['number'].toString().substring(_savedCard['number'].length - 2)}",
              color: Colors.black,
            ),
            const Spacer(),
            SvgPicture.asset("assets/svgs/arrow.svg"),
          ],
        ),
        AppSpacing.l,
        DividerSection(),
      ],
    );
  }

  Widget _buildOrderSummary() {
    if (_savedCard == null || _savedAddress == null) {
      return const SizedBox.shrink();
    }

    return CartWidget(
      image: widget.image,
      name: widget.name,
      descp: widget.desp,
      price: widget.price,
      qty: widget.qty,
      onChanged: (qty) => setState(() => selectedQty = qty),
    );
  }

  Widget _buildTotalSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomText(text: "Total", color: AppColors.textPrimary),
        CustomText(
          text: "\$ ${widget.price * selectedQty}",
          color: Colors.red.shade200,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool showSections = _savedCard == null || _savedAddress == null;

    return Scaffold(
      appBar: const CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(title: "Checkout"),

              if (showSections) ...[
                SectionHeader(title: "Shipping address"),
                AppSpacing.l,
                _buildAddressSection(),
                AppSpacing.s,
                const ShippingMethod(),
                SectionHeader(title: "Payment Method"),
              ],

              AppSpacing.l,
              _buildPaymentSection(),
              AppSpacing.l,
              _buildOrderSummary(),
              AppSpacing.xxl,
              _buildTotalSection(),
              AppSpacing.l,

              Button(
                isSvgg: true,
                title: "Place order",
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Dialog(child: CustomDailog()),
                  );
                },
              ),
              AppSpacing.xxxl,
            ],
          ),
        ),
      ),
    );
  }
}