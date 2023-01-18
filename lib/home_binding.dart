import 'package:get/get.dart';
import 'package:poc_web_navigation/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
