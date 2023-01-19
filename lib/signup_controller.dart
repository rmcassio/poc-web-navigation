import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController pwdController;

  @override
  void onInit() {
    nameController = TextEditingController();
    pwdController = TextEditingController();
    super.onInit();
  }

  void signUp(BuildContext context) async {
    if (pwdController.text.isNotEmpty && nameController.text.isNotEmpty) {
      await saveCredentials(nameController.text, pwdController.text);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ok!'),
            content: const Text('Usuário cadastrado!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  pwdController.clear();
                  nameController.clear();
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Atenção'),
            content: const Text('Preencha os campos.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
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

  Future<void> saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
  }
}
