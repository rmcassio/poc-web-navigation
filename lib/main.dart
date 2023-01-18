import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poc_web_navigation/person_model.dart';
import 'package:poc_web_navigation/route.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonModelAdapter());

  runApp(GetMaterialApp.router(
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    routerDelegate: AppRouterDelegate(),
  ));
}
