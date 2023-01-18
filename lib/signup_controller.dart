import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/route.dart';

class SignupController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController pwdController;

  @override
  void onInit() {
    nameController = TextEditingController();
    pwdController = TextEditingController();
    super.onInit();
  }

  void signUp(BuildContext context) {
    if (pwdController.text.isNotEmpty && nameController.text.isNotEmpty) {
      Get.rootDelegate.toNamed(Routes.HOME);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Atenção'),
            content: Text('Preencha os campos.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }

  void login() {
    Get.rootDelegate.toNamed(Routes.LOGIN);
  }
}
