import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(String title, String message, Color backgroundColor) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white);
}
