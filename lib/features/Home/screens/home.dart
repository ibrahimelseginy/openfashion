import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:openfashon/core/colors.dart';
import 'package:openfashon/features/Home/models/product_model.dart';
import 'package:openfashon/features/Home/screens/checkout.dart';
import 'package:openfashon/features/components/app_routers.dart';
import 'package:openfashon/features/components/custom_appbar.dart';
import 'package:openfashon/features/components/custom_text.dart';

import '../models/cover_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: CustomAppbar(isBlackk: true),
      body: Column(
        children: [
          /// texts
          SizedBox(
            height:
                MediaQuery.of(context).size.height * 0.2, // أو أي ارتفاع يناسبك
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset("assets/texts/10.svg", width: 200),
                ),
                Positioned(
                  top: 70,
                  left: 20,
                  right: 0,
                  child: SvgPicture.asset(
                    "assets/texts/October.svg",
                    width: 185,
                  ),
                ),
                Positioned(
                  top: 115,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset("assets/texts/Collection.svg"),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Image.asset("assets/cover/cover1.png"),
                        Gap(20),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: ProductModel.getProducts().length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 15,
                                childAspectRatio: 0.50,
                              ),
                          itemBuilder: (context, index) {
                            final item = ProductModel.getProducts()[index];
                            return GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.checkout,
                                arguments: Checkout(
                                  image: item.productImage,
                                  name: item.productName,
                                  price: item.productPrice.toInt(),
                                  descp: item.productDescription,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(item.productImage),
                                  Gap(10),
                                  CustomText(text: item.productName),
                                  Gap(5),
                                  CustomText(
                                    text: item.productDescription,
                                    color: Colors.grey,
                                    max: 2,
                                  ),
                                  Gap(9),
                                  CustomText(
                                    text: "\$ ${item.productPrice.toString()}",
                                    color: Colors.red.shade200,
                                    size: 20,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Gap(5),
                        CustomText(
                          text: "You may also like".toUpperCase(),
                          size: 26,
                        ),
                        Gap(10),
                        Image.asset("assets/svgs/line.png", width: 190),
                        Gap(40),
                        SizedBox(
                          height: 500,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: CoverModel.getCovers().length,
                            itemBuilder: (context, index) {
                              final item = CoverModel.getCovers()[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      item.imageUrl,
                                      height: 350,
                                      fit: BoxFit.cover,
                                    ),
                                    Gap(10),
                                    CustomText(text: item.title.toUpperCase()),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        about(),
                        Gap(20),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey.shade400,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, top: 10),
                      child: Center(
                        child: CustomText(
                          max: 3,
                          height: 2.5,
                          text: "Copyright© OpenUI All Rights Reserved.",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget about() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Ionicons.logo_twitter, color: Colors.white),
          Gap(30),
          Icon(Ionicons.logo_instagram, color: Colors.white),
          Gap(30),
          Icon(Ionicons.logo_facebook, color: Colors.white),
        ],
      ),
      Gap(20),
      Image.asset("assets/svgs/line.png", width: 190),
      Gap(20),
      CustomText(
        max: 3,
        height: 2.5,
        text:
            "          Forsah.dev  \n       +201069388721   \n   08:00 - 22:00 - Everyday  ",
      ),
      Gap(20),
      Image.asset("assets/svgs/line.png", width: 190),
      Gap(20),
      CustomText(max: 3, height: 2.5, text: "About   Contact    Blog"),
    ],
  );
}