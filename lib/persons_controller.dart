import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:poc_web_navigation/person_model.dart';

class PersonsController extends GetxController {
  final persons = <PersonModel>[].obs;

  @override
  void onReady() async {
    final box = await Hive.openBox('person');
    persons.add(box.get('person'));
    persons.refresh();
    super.onReady();
  }
}
