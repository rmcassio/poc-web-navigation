import 'package:get/get.dart';
import 'package:poc_web_navigation/signup_controller.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}
