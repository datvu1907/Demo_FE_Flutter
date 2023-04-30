import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crypto_swap/app/pages/home/home_screen.dart';
import 'package:crypto_swap/app/pages/login/login_screen.dart';
import 'package:crypto_swap/app/pages/splash/splash_controller.dart';
import 'package:crypto_swap/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // splash: Lottie.asset('assets/flight.json'),
      // splashIconSize: 250,
      // backgroundColor: AppColors.white,
      // PageTransitionType: PageTra.slideTransition,
      // nextScreen: const LoginScreen(),
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          child: Lottie.asset('assets/flight.json'),
        ),
      ),
    );
  }
}
