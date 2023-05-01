import 'package:crypto_swap/app/data/provider/flight_provider.dart';
import 'package:crypto_swap/app/data/provider/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/model/flightModel.dart';
import '../../data/model/orderModel.dart';
import '../../widgets/app_share.dart';
import '../flight/flight_controller.dart';

class CartController extends GetxController {
  RxList<FlightModel> listFlight = <FlightModel>[].obs;
  RxList<OrderModel> listOrder = <OrderModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getListFlight();
  }

  getListFlight() {
    var storage = GetStorage();
    String userId = storage.read('userId');
    var body = {"userId": userId};
    FlightProvider().getBooking(body: body).then((response) {
      for (var item in response) {
        OrderModel order = OrderModel.fromJson(item);
        FlightProvider().getFlight(flightId: order.flightId!).then((response) {
          FlightModel flight = FlightModel.fromJson(response);
          listFlight.add(flight);
          update();
        });
        listOrder.add(order);
      }
      update();
    });
  }

  void checkoutPayment(int index) {
    var body = {"bookingId": listOrder[index].id};
    PaymentProvider().payBooking(body: body).then((response) {
      OrderModel order = OrderModel.fromJson(response);
      if (order.isPaid!) {
        listFlight.removeAt(index);
        listOrder.removeAt(index);
        showSnackBar("Message", "Payment successfull", Colors.lightBlueAccent);
      } else {
        return;
      }
      update();
    });
  }
}
