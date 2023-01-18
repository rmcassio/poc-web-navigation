import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:poc_web_navigation/person_model.dart';

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

  void savePerson(BuildContext context) async {
    if (nameController.text.isNotEmpty && numberController.text.isNotEmpty && cityController.text.isNotEmpty) {
      final person = PersonModel(
        name: nameController.text,
        number: numberController.text,
        city: cityController.text,
      );

      final box = await Hive.openBox('person');

      await box.add(person);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Ok!'),
            content: Text('Pessoa criada!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  numberController.clear();
                  nameController.clear();
                  cityController.clear();
                },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }
}
