import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = Get.mediaQuery.padding.top;
    return Scaffold(
      // body: Stack(
      //   clipBehavior: Clip.none,
      //   children: <Widget>[
      //     Positioned(
      //       top: statusBarHeight - 240 / 2.9,
      //       left: Get.width - (240 / 1.6),
      //       child: Opacity(
      //         // child: Image.asset(
      //         //   // ConstsApp.BLACK_POKE,
      //         //   height: 240,
      //         //   width: 240,
      //         // ),
      //         opacity: 0.03,
      //       ),
      //     ),
      //     Container(
      //       child: Column(
      //         children: <Widget>[
      //           Container(
      //             height: statusBarHeight,
      //           ),
      //           // AppBarHome(),
      //           Expanded(
      //             child: Container(
      //               child: controller.obx((state) {
      //                 return GridPokeHome(
      //                   state: state,
      //                 );
      //               }, onError: (error) {
      //                 return GlobalError(
      //                     reload: controller.getAllPoke(), error: error);
      //               }, onLoading: GlobalLoadingGif()),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
