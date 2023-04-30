import 'package:crypto_swap/app/pages/cart/cart_screen.dart';
import 'package:crypto_swap/app/pages/flight_detail/flight_detail_screen.dart';
import 'package:crypto_swap/app/pages/home/home_screen.dart';
import 'package:crypto_swap/app/pages/order_history/order_history_screen.dart';
import 'package:crypto_swap/app/pages/splash/splash_screen.dart';
import 'package:crypto_swap/app/routes/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '';
import '../pages/login/login_screen.dart';
import '../pages/register/register_screen.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: non_constant_identifier_names
  static String INITIAL = Routes.home; //LoginPage.routeName;
  static String SPLASH = Routes.splash;
  static navigateDefaultPage() async {
    AppPages.INITIAL = Routes.home;
  }

  //
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: GetBinding(Routes.splash),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: GetBinding(Routes.home),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: GetBinding(Routes.login),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
      binding: GetBinding(Routes.register),
    ),
    GetPage(
      name: Routes.flightDetail,
      page: () => const FlightDetailScreen(),
      binding: GetBinding(Routes.flightDetail),
    ),
    GetPage(
      name: Routes.orderHistory,
      page: () => const OrderHistory(),
      binding: GetBinding(Routes.orderHistory),
    ),
    GetPage(
      name: Routes.cart,
      page: () => const CartScreen(),
      binding: GetBinding(Routes.cart),
    ),
  ];
}
