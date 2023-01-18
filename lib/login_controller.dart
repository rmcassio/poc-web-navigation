import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/route.dart';

class LoginController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController pwdController;

  @override
  void onInit() {
    nameController = TextEditingController();
    pwdController = TextEditingController();
    super.onInit();
  }

  void login(BuildContext context) {
    if (pwdController.text == '123' && nameController.text == 'cassio') {
      Get.rootDelegate.toNamed(Routes.HOME);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Atenção'),
            content: Text('Campos incorretos/vazios.'),
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

  void signUp() {
    Get.rootDelegate.toNamed(Routes.SIGNUP);
  }
}
