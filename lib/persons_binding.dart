import 'package:get/get.dart';
import 'package:poc_web_navigation/persons_controller.dart';

class PersonsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PersonsController());
  }
}
