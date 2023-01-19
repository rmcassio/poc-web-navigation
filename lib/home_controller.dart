import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/person_model.dart';
import 'package:poc_web_navigation/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController numberController;
  late TextEditingController cityController;

  @override
  void onInit() {
    nameController = TextEditingController();
    numberController = TextEditingController();
    cityController = TextEditingController();
    super.onInit();
  }

  storePerson(Map<String, dynamic> person) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('person', json.encode(person));
  }

  void savePerson(BuildContext context) async {
    if (nameController.text.isNotEmpty && numberController.text.isNotEmpty && cityController.text.isNotEmpty) {
      final person = PersonModel(
        name: nameController.text,
        number: numberController.text,
        city: cityController.text,
      );

      storePerson(person.toJson());

      // final box = await Hive.openBox('person');

      // await box.put('person', person);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ok!'),
            content: const Text('Pessoa criada!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  numberController.clear();
                  nameController.clear();
                  cityController.clear();
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }

  void seePersons() {
    Get.rootDelegate.toNamed(Routes.PERSONS);
  }
}
