import 'package:crypto_swap/app/data/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/provider/user_provider.dart';
import '../../routes/app_pages.dart';
import '../../widgets/app_share.dart';

class ProfileController extends GetxController {
  Rx<UserModel> user = UserModel(name: '').obs;
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  void getUserInfo() {
    UserProvider().getUser().then((response) {
      user.value = UserModel.fromJson(response);
      update();
    }, onError: (err) {
      showSnackBar("Error", err.toString(), Colors.red);
    });
  }

  void logOut() {
    var storage = GetStorage();
    storage.remove('isLogin');
    storage.remove('userId');
    Get.offAllNamed(Routes.login);
  }
}
