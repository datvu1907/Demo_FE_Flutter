import 'package:crypto_swap/app/pages/flight/flight_screen.dart';
import 'package:crypto_swap/app/pages/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class HomeController extends GetxController with StateMixin {
  final Rx<int> currentIndex = 0.obs;
  BuildContext? context = Get.context;
  final List<Widget> menuPages = const [
    TabNav(0, FlightScreen()),
    TabNav(1, ProfileScreen()),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  onChange(int value) {
    currentIndex.value = value;
  }
  // final PokeApiRepository _pokeApiRepository;
  //
  // HomeController(this._pokeApiRepository);
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   getAllPoke();
  // }
  //
  // Future getAllPoke() async {
  //   change([], status: RxStatus.loading());
  //
  //   try {
  //     final data = await _pokeApiRepository.getAll();
  //
  //     change(data, status: RxStatus.success());
  //   } catch (e) {
  //     print(e);
  //     change([], status: RxStatus.error('Deu ruim! Bora tentar mais uma vez?'));
  //   }
  // }
}
