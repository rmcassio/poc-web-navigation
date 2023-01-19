import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/login_controller.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: SizedBox(
            height: 400,
            width: 400,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('LOGIN'),
                      TextFormField(
                        controller: controller.nameController,
                      ),
                      TextFormField(
                        controller: controller.pwdController,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(onPressed: () => controller.login(context), child: const Text('Entrar')),
                      const SizedBox(height: 20),
                      TextButton(onPressed: () => controller.signUp(), child: const Text('Cadastre-se'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
