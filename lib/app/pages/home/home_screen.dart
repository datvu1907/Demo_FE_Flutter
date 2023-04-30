import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_navigaiton_bar.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return CustomBottomNavigationBar(
            height: 80,
            fontSize: 12,
            onTap: (value) => controller.onChange(value),
            currentIndex: controller.currentIndex(),
            items: [
              NavigationBarItem(title: 'Home', icon: Icons.home),
              NavigationBarItem(
                title: 'Profile',
                icon: Icons.person,
              ),
            ],
          );
        },
      ),
      body: Obx(() => IndexedStack(
            index: controller.currentIndex(),
            children: controller.menuPages,
          )),
    );
  }
}

class TabNav extends GetView<HomeController> {
  final int navKey;
  final Widget widget;

  // ignore: use_key_in_widget_constructors
  const TabNav(this.navKey, this.widget);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(navKey),
      onGenerateRoute: (settings) {
        return GetPageRoute(page: () => widget);
      },
    );
  }
}
