import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/person_model.dart';
import 'package:poc_web_navigation/route.dart';
import 'package:poc_web_navigation/shared_preferences_utils.dart';

class HomeController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController numberController;
  late TextEditingController cityController;
  final List<PersonModel> persons = [];

  @override
  void onInit() {
    nameController = TextEditingController();
    numberController = TextEditingController();
    cityController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    final personsJson = SharedPreferencesUtils.getString('persons') ?? '';
    if (personsJson.isNotEmpty) {
      final json = jsonDecode(SharedPreferencesUtils.getString('persons')!);
      persons.addAll(PersonModel.fromListJson(json: json));
    }
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
