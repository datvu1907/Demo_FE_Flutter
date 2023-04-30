import 'package:crypto_swap/app/routes/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: non_constant_identifier_names
  static String INITIAL = Routes.homePage; //LoginPage.routeName;

  static navigateDefaultPage() async {
    AppPages.INITIAL = Routes.homePage;
  }

  //
  static final routes = [
    GetPage(
      name: Routes.homePage,
      page: () => Container(),
      binding: GetBinding(Routes.homePage),
    ),
  ];
}
