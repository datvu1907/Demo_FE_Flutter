import 'package:get/get.dart';
import 'app_pages.dart';

class GetBinding extends Bindings {
  final String routerName;

  GetBinding(this.routerName);

  @override
  void dependencies() {
    switch (routerName) {
      case Routes.homePage:
      // Get.lazyPut(() => HomePageController());
      // break;
      /* Example
      case ExamplePage.routeName:
        Get.lazyPut(() => ExamplePageController());
        break;
      */
      default:
    }
  }
}
