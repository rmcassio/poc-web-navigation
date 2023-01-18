import 'package:get/get.dart';
import 'package:poc_web_navigation/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
