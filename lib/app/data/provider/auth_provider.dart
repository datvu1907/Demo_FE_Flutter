import 'dart:convert';

import 'package:get/get.dart';
import '../model/model.dart';

class AuthProvider extends GetConnect {
  static String baseURL = "http://192.168.1.222:8000/api/auth/";
  Future<dynamic> login({required dynamic body}) async {
    try {
      final response = await post(baseURL + "login", jsonEncode(body));
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body['data'];
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<dynamic> register({required dynamic body}) async {
    try {
      final response = await post(baseURL + "register", jsonEncode(body));
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body['user'];
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
