import 'dart:convert';

import 'package:crypto_swap/app/pages/order_history/order_history_screen.dart';
import 'package:get/get.dart';
import '../model/model.dart';

class PaymentProvider extends GetConnect {
  static String baseURL = "http://192.168.1.222:8000/api/payment/";
  Future<dynamic> payBooking({required dynamic body}) async {
    try {
      final response = await post(baseURL + "payBooking", jsonEncode(body));
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body['data'];
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<dynamic> orderHistory({required dynamic body}) async {
    try {
      final response = await post(baseURL + "orderHistory", jsonEncode(body));
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
