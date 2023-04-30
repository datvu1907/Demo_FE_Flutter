import 'package:crypto_swap/app/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../themes/app_colors.dart';
import '../../widgets/custom_button.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ProfileController>(builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/avatar.jpg')),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(controller.user.value.name!,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.cart),
                    child:
                        buildItem(title: 'Cart', iconData: Icons.shopping_bag),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: buildItem(
                        title: 'Order History', iconData: Icons.list_alt),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  buildBottomButton(),
                ]),
          );
        }),
      ),
    );
  }

  Widget buildItem({
    required String title,
    required IconData iconData,
  }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          height: 66,
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
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 21),
                child: Icon(
                  iconData,
                  color: AppColors.textOrange,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.textPrimaryColor,
                  size: 12,
                ),
              )
            ],
          ),
        ),
      );
  Widget buildBottomButton() => Container(
        margin: const EdgeInsets.only(bottom: 30),
        alignment: Alignment.bottomCenter,
        child: CustomTextButton(
          borderColor: AppColors.textLightPurple,
          onPressed: () => controller.logOut(),
          width: 155,
          height: 35,
          title: 'Log out',
          textColor: AppColors.textLightPurple,
        ),
      );
}
