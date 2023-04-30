import 'package:crypto_swap/app/pages/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:get/get.dart';

import '../../data/model/flightModel.dart';
import '../../themes/app_colors.dart';
import '../../widgets/custom_button.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<CartController>(builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 12,
                        color: AppColors.textPrimaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimaryColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                buildListReward()
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget buildListReward() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("All Order",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor)),
          ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listFlight.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: flightItem(controller.listFlight[index]),
                );
              })
        ],
      );
  Widget flightItem(FlightModel flight) => GestureDetector(
        child: Container(
            height: 100,
            width: Get.width - 50,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 10,
                      offset: Offset(0.0, 2.0))
                ]),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Image.network(
                        flight.image!,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(flight.title!,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimaryColor)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(flight.date!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textLightPurple)),
                        ],
                      ),
                    ),
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: Icon(
                          Icons.paid,
                          color: Colors.green,
                          size: 20,
                        ))
                  ],
                ),
              ],
            )),
      );
}
