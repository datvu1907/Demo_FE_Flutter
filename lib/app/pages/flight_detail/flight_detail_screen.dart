import 'package:crypto_swap/app/data/model/flightModel.dart';
import 'package:crypto_swap/app/pages/flight/flight_controller.dart';
import 'package:crypto_swap/app/pages/flight_detail/flight_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import '../../themes/app_colors.dart';
import '../../widgets/custom_button.dart';

class FlightDetailScreen extends GetView<FlightDetailController> {
  const FlightDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: GetBuilder<FlightDetailController>(builder: (_) {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
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
                  )),
              Image.network(
                controller.flight.value.image!,
                width: Get.width,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(controller.flight.value.title!,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimaryColor)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(controller.flight.value.date!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textPrimaryColor)),
                    Text(controller.flight.value.price!.toString().toVND(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textOrange)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(controller.flight.value.description!,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimaryColor)),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: CustomTextButton(
                    title: 'Add to cart',
                    borderRadius: BorderRadius.circular(10),
                    height: 40,
                    width: Get.width - 50,
                    borderColor: AppColors.textOrange,
                    color: AppColors.textOrange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    onPressed: controller.addToCart),
              )
            ],
          ),
        );
      }
    })));
  }
}
