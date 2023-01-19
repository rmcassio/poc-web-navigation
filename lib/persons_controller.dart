import 'dart:convert';

import 'package:get/get.dart';
import 'package:poc_web_navigation/person_model.dart';
import 'package:poc_web_navigation/shared_preferences_utils.dart';

class PersonsController extends GetxController {
  final persons = <PersonModel>[].obs;

  @override
  void onReady() async { 
    
       
    final json = jsonDecode(SharedPreferencesUtils.getString('persons'));

    persons.addAll(PersonModel.fromListJson(json: json));

    persons.refresh();
    super.onReady();
  }
}
