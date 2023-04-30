import 'dart:developer';

import 'package:crypto_swap/app/data/provider/auth_provider.dart';
import 'package:crypto_swap/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/model/userModel.dart';
import '../../routes/app_pages.dart';
import '../../widgets/app_share.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool error = false.obs;
  RxBool visibility = true.obs;

  void hidePassword() {
    visibility.value = !visibility.value;
  }

  void signIn() {
    EasyLoading.show();
    var storage = GetStorage();
    var body = {
      'email': emailController.text,
      'password': passwordController.text
    };
    try {
      AuthProvider().login(body: body).then((response) {
        EasyLoading.dismiss();
        showSnackBar("Message", "Login successfully", Colors.lightBlueAccent);
        UserModel user = UserModel.fromJson(response);
        storage.write('isLogin', true);
        storage.write('userId', user.id);
        Get.offAllNamed(Routes.home);
      }, onError: (err) {
        EasyLoading.dismiss();
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (e) {
      EasyLoading.dismiss();
      showSnackBar("Exception", e.toString(), Colors.red);
    }
  }
}
