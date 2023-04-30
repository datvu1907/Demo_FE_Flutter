import 'dart:async';

import 'package:async/async.dart';
import 'package:crypto_swap/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final activeStr = 0.obs;
  final memo = AsyncMemoizer<void>();
  final isLoggedIn = false.obs;
  bool get isLoggedInValue => isLoggedIn.value;

  @override
  void onInit() {
    super.onInit();
    memo.runOnce(_initFunction);
  }

  void _changeActiveString() {
    activeStr.value = (activeStr.value + 1);
  }

  Future<void> _initFunction() async {
    final t = Timer.periodic(
      const Duration(milliseconds: 200),
      (t) => _changeActiveString(),
    );
    await Future.delayed(const Duration(seconds: 3));
    await checkLogin();
    t.cancel();
  }

  Future<void> checkLogin() async {
    final storage = GetStorage();
    if (storage.read('isLogin') == null || storage.read('isLogin') == false) {
      Get.offAllNamed(Routes.login);
      return;
    } else {
      Get.offAllNamed(Routes.home);
      return;
    }
  }
}
