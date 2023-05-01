import 'package:crypto_swap/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/pages/splash/splash_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/widgets/custom_animation.dart';

void main() {
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var storage = GetStorage();

    String initRoute;
    if (storage.read('login') != null) {
      initRoute = AppPages.INITIAL;
    } else {
      initRoute = AppPages.INITIAL;
    }
    return GetMaterialApp(
        initialBinding: BindingsBuilder(
          () {
            Get.put(SplashController());
          },
        ),
        debugShowCheckedModeBanner: false,
        title: 'Booking Flight',
        theme: ThemeData(
          textTheme: GoogleFonts.sourceSansProTextTheme(
            Theme.of(context).textTheme,
          ),
          backgroundColor: AppColors.screenBackground,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.ctaColor),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                    color: AppColors.textPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          dialogTheme: const DialogTheme(
              backgroundColor: AppColors.white,
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              contentTextStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryColor,
              ),
              elevation: 20),
        ),
        supportedLocales: const <Locale>[
          Locale('en', ''),
          Locale('zh', ''),
          Locale('ms', ''),
        ],
        // locale: LanguageSetting.instance.currentLocale,
        // fallbackLocale: LanguageSetting.instance.fallbackLocale,
        // translations: LanguageSetting.instance,
        initialRoute: AppPages.SPLASH,
        getPages: AppPages.routes,
        builder: EasyLoading.init());
  }
}
