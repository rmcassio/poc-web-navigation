import 'dart:convert';

import 'package:get/get.dart';
import 'package:poc_web_navigation/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonsController extends GetxController {
  final persons = <PersonModel>[].obs;

  @override
  void onReady() async {
    // final box = await Hive.openBox('person');
    // persons.add(box.get('person'));

    final sharedUser = await SharedPreferences.getInstance();
    Map personMap = jsonDecode(sharedUser.getString('person')!);
    final person = PersonModel.fromJson(json: personMap);

    persons.add(person);

    persons.refresh();
    super.onReady();
  }
}
