import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/model.dart';

class UserProvider extends GetConnect {
  static String baseURL = "http://192.168.1.222:8000/api/user/";
  Future<dynamic> getUser() async {
    var storage = GetStorage();
    String userId = storage.read('userId');
    try {
      final response = await get(baseURL + "getUser/?user_id=$userId");
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
