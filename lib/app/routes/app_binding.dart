import 'package:crypto_swap/app/pages/cart/cart_controller.dart';
import 'package:crypto_swap/app/pages/flight/flight_controller.dart';
import 'package:crypto_swap/app/pages/flight_detail/flight_detail_controller.dart';
import 'package:crypto_swap/app/pages/order_history/order_history_controller.dart';
import 'package:crypto_swap/app/pages/profile/profile_controller.dart';
import 'package:crypto_swap/app/pages/register/register_controller.dart';
import 'package:get/get.dart';
import '../pages/home/home_controller.dart';
import '../pages/login/login_controller.dart';
import 'app_pages.dart';

class GetBinding extends Bindings {
  final String routerName;

  GetBinding(this.routerName);

  @override
  void dependencies() {
    switch (routerName) {
      case Routes.home:
        Get.lazyPut(() => HomeController());
        Get.lazyPut(() => FlightController());
        Get.lazyPut(() => ProfileController());
        break;
      case Routes.login:
        Get.lazyPut(() => LoginController());
        break;
      case Routes.register:
        Get.lazyPut(() => RegisterController());
        break;
      case Routes.flightDetail:
        Get.lazyPut(() => FlightDetailController());
        break;
      case Routes.orderHistory:
        Get.lazyPut(() => OrderHistoryController());
        break;
      case Routes.cart:
        Get.lazyPut(() => CartController());
        break;
      // break;
      /* Example
      case ExamplePage.routeName:
        Get.lazyPut(() => ExamplePageController());
        break;
      */
      default:
        Get.lazyPut(() => HomeController());
        break;
    }
  }
}
