import 'package:crypto_swap/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/model/userModel.dart';
import '../../data/provider/auth_provider.dart';
import '../../themes/app_colors.dart';
import '../../widgets/app_share.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  RxBool error = false.obs;
  RxBool visibility = true.obs;
  RxBool visibilityConfirm = true.obs;

  void hidePassword() {
    visibility.value = !visibility.value;
  }

  void hideConfirmPassword() {
    visibilityConfirm.value = !visibilityConfirm.value;
  }

  void register() {
    EasyLoading.show();
    var storage = GetStorage();
    var body = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'passwordConfirm': passwordConfirmController.text,
    };
    try {
      AuthProvider().register(body: body).then((response) {
        EasyLoading.dismiss();
        showSnackBar(
            "Message", "Register successfully", Colors.lightBlueAccent);
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
