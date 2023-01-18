import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/route.dart';
import 'package:poc_web_navigation/signup_controller.dart';

class Signup extends GetView<SignupController> {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 250, horizontal: 600),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('CADASTRE-SE'),
                    TextFormField(
                      controller: controller.nameController,
                    ),
                    TextFormField(
                      controller: controller.pwdController,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(onPressed: () => controller.signUp(context), child: const Text('Cadastrar')),
                    const SizedBox(height: 20),
                    TextButton(onPressed: () => controller.login(), child: const Text('Entrar'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
