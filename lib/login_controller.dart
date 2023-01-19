import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController pwdController;

  @override
  void onInit() {
    nameController = TextEditingController();
    pwdController = TextEditingController();
    super.onInit();
  }

  void login(BuildContext context) async {
    final userName = await getUsername();
    final pwd = await getPassword();

    if (userName != null && pwd != null) {
      if (pwdController.text == pwd && nameController.text == userName) {
        Get.rootDelegate.toNamed(Routes.HOME);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Atenção'),
              content: const Text('Campos incorretos/vazios.'),
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
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Atenção'),
            content: Text('Usuário não encontrado'),
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

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }
}
