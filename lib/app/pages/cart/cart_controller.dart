import 'package:get/get.dart';

import '../../data/model/flightModel.dart';
import '../flight/flight_controller.dart';

class CartController extends GetxController {
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
