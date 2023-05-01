import 'package:crypto_swap/app/pages/login/login_controller.dart';
import 'package:crypto_swap/app/routes/app_pages.dart';
import 'package:crypto_swap/app/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';

import '../../themes/app_colors.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height / 5),
                child: Center(
                  child: Text(
                    'Login Screen',
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buildEmailField(),
              const SizedBox(
                height: 10,
              ),
              buildPasswordField(),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "Don't have account",
                      style: GoogleFonts.poppins(
                          color: AppColors.textOrange,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  •  ',
                          style: GoogleFonts.poppins(
                              color: AppColors.textPrimaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                            text: 'Register here',
                            style: GoogleFonts.poppins(
                                color: AppColors.textPrimaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Routes.register);
                              })
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextButton(
                  title: 'Sign In',
                  height: 50,
                  width: Get.width - 50,
                  borderColor: AppColors.textOrange,
                  color: AppColors.textOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  onPressed: controller.signIn),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildEmailField() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor)),
            const SizedBox(
              height: 7,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: controller.error.value ? Colors.red : Colors.white),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 10,
                      offset: Offset(0.0, 2.0))
                ],
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                // onChanged: (value) => controller.validateOTP(value),
                // onChanged: controller.handleOTP(),
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 20, top: 12, bottom: 12),
                  hintStyle: TextStyle(fontSize: 12, color: AppColors.hintText),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimaryColor),
                cursorColor: AppColors.textPrimaryColor,
              ),
            ),
            controller.error.value
                ? Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'invalid_code'.tr,
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(
              height: 26,
            ),
          ],
        ));
  }

  Widget buildPasswordField() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Password',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor)),
            const SizedBox(
              height: 7,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: controller.error.value ? Colors.red : Colors.white),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 10,
                      offset: Offset(0.0, 2.0))
                ],
              ),
              child: TextFormField(
                controller: controller.passwordController,
                obscureText: controller.visibility.value,
                // onChanged: (value) => controller.validateOTP(value),
                // onChanged: controller.handleOTP(),
                maxLines: 1,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 12, bottom: 12),
                    hintStyle:
                        TextStyle(fontSize: 12, color: AppColors.hintText),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword(),
                        icon: Icon(
                          controller.visibility.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.primaryColor,
                        ))),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimaryColor),
                cursorColor: AppColors.textPrimaryColor,
              ),
            ),
            controller.error.value
                ? Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'invalid_code'.tr,
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(
              height: 26,
            ),
          ],
        ));
  }
}
