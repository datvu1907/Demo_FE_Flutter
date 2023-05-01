import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/model.dart';

class FlightProvider extends GetConnect {
  static String baseURL = "http://192.168.1.222:8000/api/flight/";
  Future<dynamic> getAllFlights() async {
    try {
      final response = await get(baseURL + "getAllFlights");
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body['data'];
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<dynamic> getFlight({required String flightId}) async {
    try {
      final response = await post(baseURL + "getFlight?id=$flightId", null);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body['data'];
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<dynamic> bookFlight({required dynamic body}) async {
    try {
      final response = await post(baseURL + "bookFlight", jsonEncode(body));
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body['Message'];
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<dynamic> getBooking({required dynamic body}) async {
    try {
      final response = await post(baseURL + "getBooking", jsonEncode(body));
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body['data'];
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
