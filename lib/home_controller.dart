import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/person_model.dart';
import 'package:poc_web_navigation/route.dart';
import 'package:poc_web_navigation/shared_preferences_utils.dart';
import 'package:poc_web_navigation/system_cache.dart';

class HomeController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController numberController;
  late TextEditingController cityController;
  late List<PersonModel> persons;

  @override
  void onInit() {
    nameController = TextEditingController();
    numberController = TextEditingController();
    cityController = TextEditingController();
    persons = SystemCache.personsCache ?? [];
    super.onInit();
  }

  void savePerson(BuildContext context) async {
    if (nameController.text.isNotEmpty && numberController.text.isNotEmpty && cityController.text.isNotEmpty) {
      final person = PersonModel(
        name: nameController.text,
        number: numberController.text,
        city: cityController.text,
      );

      persons.add(person);

      SharedPreferencesUtils.setString('persons', jsonEncode(persons));

      SystemCache.personsCache = persons;

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
