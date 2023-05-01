import 'package:crypto_swap/app/data/model/flightModel.dart';
import 'package:crypto_swap/app/data/provider/payment.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/model/orderModel.dart';
import '../../data/provider/flight_provider.dart';
import '../flight/flight_controller.dart';

class OrderHistoryController extends GetxController {
  RxList<FlightModel> listFlight = <FlightModel>[].obs;
  RxList<OrderModel> listOrder = <OrderModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getListFlight();
  }

  getListFlight() {
    var storage = GetStorage();
    var userId = storage.read('userId');
    var body = {"userId": userId};
    PaymentProvider().orderHistory(body: body).then((response) {
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
}
