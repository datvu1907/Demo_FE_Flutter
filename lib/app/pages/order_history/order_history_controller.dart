import 'package:crypto_swap/app/data/model/flightModel.dart';
import 'package:get/get.dart';

import '../flight/flight_controller.dart';

class OrderHistoryController extends GetxController {
  RxList<FlightModel> listFlight = <FlightModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getListFlight();
  }

  getListFlight() {
    for (var item in dummyData) {
      FlightModel flight = FlightModel.fromJson(item);
      listFlight.add(flight);
    }
  }
}
