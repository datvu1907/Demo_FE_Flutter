import 'package:crypto_swap/app/data/model/flightModel.dart';
import 'package:crypto_swap/app/data/provider/flight_provider.dart';
import 'package:crypto_swap/app/pages/flight/flight_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../widgets/app_share.dart';

class FlightDetailController extends GetxController {
  var data = dummyData;
  String flightId = Get.arguments[0];
  RxBool isLoading = true.obs;
  Rx<FlightModel> flight = FlightModel().obs;
  @override
  void onInit() {
    super.onInit();
    getFlight();
  }

  getFlight() {
    FlightProvider().getFlight(flightId: flightId).then((response) {
      isLoading.value = false;
      flight.value = FlightModel.fromJson(response);
      update();
    }, onError: (err) {
      isLoading.value = false;
      showSnackBar("Error", err.toString(), Colors.red);
      update();
    });
  }

  addToCart() async {
    EasyLoading.show();
    var storage = GetStorage();
    String userId = storage.read('userId');
    var body = {"flightId": flightId, "userId": userId};

    FlightProvider().bookFlight(body: body).then((response) {
      EasyLoading.dismiss();
      Get.back();
      showSnackBar(
          "Message", "Flight is added to cart", Colors.lightBlueAccent);
    }, onError: (err) {
      EasyLoading.dismiss();
      showSnackBar("Error", err.toString(), Colors.red);
      update();
    });

    // if (result) {

    // } else {
    //   showSnackBar("Error", "Add to cart fail", Colors.red);
    // }
  }
}
